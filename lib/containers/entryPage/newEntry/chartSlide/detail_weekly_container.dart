import 'package:flutter/material.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/views/homePage/chartSlide/weekly_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class DetailWeeklyChartContainer extends StatefulWidget {
  DetailWeeklyChartContainer({Key key, @required this.productInfo}) : super(key: key);
  final ProductInfoModel productInfo;

  @override
  _DetailWeeklyChartContainerState createState() => _DetailWeeklyChartContainerState();
}

class _DetailWeeklyChartContainerState extends State<DetailWeeklyChartContainer> with AutomaticKeepAliveClientMixin <DetailWeeklyChartContainer>{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomeWeeklyChartScreen(
          loading: vm.loading,
          error: vm.noError,
          overalWeeklyData: vm.overalWeeklyData
          
        );
      },
      converter: _ViewModel.fromStore,
      // onInit: (store) {
      //   store.dispatch(
      //     LoadOveralWeeklyAction(),
      //   );
      // },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class _ViewModel {
  _ViewModel({
    this.loading,
    this.overalWeeklyData,
    this.store,
    this.noError,
  });

  final bool loading;
  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.detailOveralWeeklyState.loading,
      overalWeeklyData: store.state.detailOveralWeeklyState.overalWeeklyData,
      store: store,
      noError: store.state.detailOveralWeeklyState.error == null,
    );
  }
}