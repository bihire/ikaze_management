import 'package:flutter/material.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/detail_monthly_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';



class DetailMonthlyChartContainer extends StatefulWidget {
  DetailMonthlyChartContainer({Key key, @required this.productInfo}) : super(key: key);
  final ProductInfoModel productInfo;

  @override
  _DetailMonthlyChartContainerState createState() =>
      _DetailMonthlyChartContainerState();
}

class _DetailMonthlyChartContainerState extends State<DetailMonthlyChartContainer>
     
       with AutomaticKeepAliveClientMixin<DetailMonthlyChartContainer> {
  @override
  Widget build(BuildContext context) {
    
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return DetailMonthlyChartScreen(
          loading: vm.loading,
          error: vm.noError,
          overalMonthlyData: vm.overalMonthlyData
          
        );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.overalMonthlyData,
    this.store,
    this.noError,
  });

  final bool loading;
  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.detailOveralMonthlyState.loading,
      overalMonthlyData: store.state.detailOveralMonthlyState.overalMonthlyData,
      store: store,
      noError: store.state.detailOveralMonthlyState.error == null,
    );
  }
}
