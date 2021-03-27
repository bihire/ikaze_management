
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_monthly_action.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/actions/homePage/transactions/transactionList.dart';
import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/homePage/home_page.dart';
import 'package:redux/redux.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return HomePageScreen(
          homeloading: vm.homeloading,
          isNextPageAvailable: vm.isNextPageAvailable,
          transactions: vm.transactions,
          store: vm.store,
          refresh: vm.onRefresh,
          // loadNextPage: vm.onLoadNextPage,
          // noError: vm.noError,
        );
      },
      converter: _ViewModel.fromStore,
      // onInit: (store) {
      //   store.dispatch(
      //     LoadHomeTransactionsPageAction(
      //         pageNumber: 1,
      //         transactionsPerPage: TransactionState.transactionsPerPage),
      //   );
      // },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.homeloading,
    this.isNextPageAvailable,
    this.transactions,
    this.store,
    // this.noError,
  });

  final bool homeloading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Store<AppState> store;
  // final bool noError;

  // void onLoadNextPage() {
  //   if (!loading && isNextPageAvailable) {
  //     store.dispatch(LoadHomeTransactionsPageAction(
  //       pageNumber:
  //           (transactions.length ~/ TransactionState.transactionsPerPage) + 1,
  //       transactionsPerPage: TransactionState.transactionsPerPage,
  //     ));
  //   }
  // }

  onRefresh() {
    store.dispatch(LoadDashboardDailyTotalAction());
    store.dispatch(LoadOvaralDailyAction());
    store.dispatch(LoadOveralWeeklyAction());
    store.dispatch(LoadOveralMonthlyAction());
  }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      homeloading: store.state.homeTransactionListState.loading,
      isNextPageAvailable: store.state.homeTransactionListState.isNextPageAvailable,
      transactions: store.state.homeTransactionListState.transactions,
      store: store,
      // noError: store.state.allTransactionsState.error == null,
    );
  }
}
