import 'package:flutter/material.dart';
// import 'package:inventory_controller/containers/homePage/overal_daily_mv.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:inventory_controller/components/slidingTabView/buttons_tabbar.dart';

import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_monthly_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/views/homePage/chartSlide/daily_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class HomeDailyChartContainer extends StatefulWidget {
  HomeDailyChartContainer({Key key}) : super(key: key);

  @override
  _HomeDailyChartContainerState createState() =>
      _HomeDailyChartContainerState();
}

class _HomeDailyChartContainerState extends State<HomeDailyChartContainer>
    with AutomaticKeepAliveClientMixin<HomeDailyChartContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomeDailyChartScreen(
          loading: vm.isDataLoading,
          error: vm.noError,
          overalDailyData: vm.overalDailydata,
          
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadOvaralDailyAction(),
        );
        store.dispatch(
          LoadOveralWeeklyAction(),
        );
        store.dispatch(
          LoadOveralMonthlyAction(),
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
