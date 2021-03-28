import 'package:flutter/material.dart';
import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class NewDetailContainer extends StatefulWidget {
  @override
  _NewDetailContainerState createState() => _NewDetailContainerState();
}

class _NewDetailContainerState extends State<NewDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return NewEntryScreen(
          loading: vm.loading,
          error: vm.error,
          dailyTotal: vm.dailyTotal,
          // productInfo: widget.productInfo
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
    this.error,
  });

  final bool loading;
  final String dailyTotal;
  final Store<AppState> store;
  final bool error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.detailDailySalesTotalState.loading,
      dailyTotal: store.state.detailDailySalesTotalState.dailyTotal,
      store: store,
      error: store.state.detailDailySalesTotalState.error == null,
    );
  }
}
