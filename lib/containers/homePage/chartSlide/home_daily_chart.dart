import 'package:flutter/material.dart';
// import 'package:inventory_controller/containers/homePage/overal_daily_mv.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:inventory_controller/components/slidingTabView/buttons_tabbar.dart';

import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/views/homePage/chartSlide/daily_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class HomeDailyChartContainer extends StatefulWidget {
  HomeDailyChartContainer({Key key}) : super(key: key);

  @override
  _HomeDailyChartContainerState createState() => _HomeDailyChartContainerState();
}

class _HomeDailyChartContainerState extends State<HomeDailyChartContainer> with AutomaticKeepAliveClientMixin <HomeDailyChartContainer>{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomeDailyChartScreen(
          day_0: ((vm.overalDailydata)
          .firstWhere((item) => item.rangeName == 'day_0')).totalAmount,
          day_1: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_1')).totalAmount,
          day_2: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_2')).totalAmount,
          day_3: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_3')).totalAmount,
          day_4: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_4')).totalAmount,
          day_5: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_5')).totalAmount,
          day_6: ((vm.overalDailydata)
              .firstWhere((item) => item.rangeName == 'day_6')).totalAmount,
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadOvaralDailyAction(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class _ViewModel {
  _ViewModel({
    this.isDataLoading,
    this.overalDailydata,
    this.store,
    this.noError,
  });

  final bool isDataLoading;
  final List<OveralDailyTransactionModel> overalDailydata;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isDataLoading: store.state.ovaraldailyState.isDataLoading,
      overalDailydata: store.state.ovaraldailyState.overalDailydata,
      store: store,
      noError: store.state.ovaraldailyState.error == null,
    );
  }
}