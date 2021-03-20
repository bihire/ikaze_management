import 'package:flutter/material.dart';
// import 'package:inventory_controller/containers/homePage/overal_daily_mv.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';

import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_monthly_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_daily_action.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_monthly_action.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_weekly_actions.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/daily_chart.dart';
// import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class DetailDailyChartContainer extends StatefulWidget {
  DetailDailyChartContainer({Key key}) : super(key: key);

  @override
  _DetailDailyChartContainerState createState() =>
      _DetailDailyChartContainerState();
}

class _DetailDailyChartContainerState extends State<DetailDailyChartContainer>
    with AutomaticKeepAliveClientMixin<DetailDailyChartContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return DetailDailyChartScreen(
          loading: vm.isDataLoading,
          error: vm.noError,
          overalDailyData: vm.overalDailydata,
          
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          DetailOvaralDailyAction(),
        );
        store.dispatch(
          DetailOveralWeeklyAction(),
        );
        store.dispatch(
          DetailOveralMonthlyAction(),
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
