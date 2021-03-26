import 'package:flutter/material.dart';
import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class DetailDailyTotalContainer extends StatefulWidget {
  @override
  _DetailDailyTotalState createState() => _DetailDailyTotalState();
}

class _DetailDailyTotalState extends State<DetailDailyTotalContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return TopSummaryCard(
          loading: vm.loading,
          dailyTotal: vm.dailyTotal,
          error: vm.noError,
        );
        
      },
      converter: _ViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        store.dispatch(
          DetailDailySumAction(),
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.dailyTotal,
    this.store,
    this.noError,
  });

  final bool loading;
  final String dailyTotal;
  final Store<AppState> store;
  final bool noError;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.detailDailySalesTotalState.loading,
      dailyTotal: store.state.detailDailySalesTotalState.dailyTotal,
      store: store,
      noError: store.state.detailDailySalesTotalState.error == null,
    );
  }
}
