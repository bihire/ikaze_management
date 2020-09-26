import 'package:flutter/material.dart';
// import 'package:inventory_controller/models/overal_daily_model.dart';
// import 'package:inventory_controller/redux/actions/overal_daily_action.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
// import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:inventory_controller/redux/appState/app_state.dart';

// import 'package:skeleton_text/skeleton_text.dart';

class OveralDailyVm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChartSample1();
    // StoreConnector<AppState, _ViewModel>(
    //   builder: (context, vm) {
    //     print(((vm.overalDailydata)
    //         .firstWhere((item) => item.rangeName == 'day_0')).totalAmount);
    //     return BarChartSample1();
    //   },
    //   converter: _ViewModel.fromStore,
    //   onInit: (store) {
    //     store.dispatch(
    //       LoadOvaralDailyAction(),
    //     );
    //   },
    // );
  }
}

// class _ViewModel {
//   _ViewModel({
//     this.isDataLoading,
//     this.overalDailydata,
//     this.store,
//     this.noError,
//   });

//   final bool isDataLoading;
//   final List<OveralDailyTransactionModel> overalDailydata;
//   final Store<AppState> store;
//   final bool noError;

//   static _ViewModel fromStore(Store<AppState> store) {
//     return _ViewModel(
//       isDataLoading: store.state.ovaraldailyState.isDataLoading,
//       overalDailydata: store.state.ovaraldailyState.overalDailydata,
//       store: store,
//       noError: store.state.ovaraldailyState.error == null,
//     );
//   }
// }
