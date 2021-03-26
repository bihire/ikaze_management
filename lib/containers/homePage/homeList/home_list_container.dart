import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/homePage/transactions/transactionList.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/appState/homePage/transactions/home_transaction_list.dart';
import 'package:redux/redux.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return MoneyTransactionModelListItem(
                itemIndex: index, transaction: vm.transactions[index]);
          }, childCount: vm.transactions.length),
        );
        // HomePageScreen(
        //   loading: vm.loading,
        //   isNextPageAvailable: vm.isNextPageAvailable,
        //   transactions: vm.transactions,
        //   // refresh: vm.onRefresh,
        //   loadNextPage: vm.onLoadNextPage,
        //   noError: vm.noError,
        // );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadHomeTransactionsPageAction(
              pageNumber: 1,
              transactionsPerPage: HomeTransactionListState.transactionsPerPage),
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loading,
    this.isNextPageAvailable,
    this.transactions,
    this.store,
    this.noError,
  });

  final bool loading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Store<AppState> store;
  final bool noError;

  void onLoadNextPage() {
    if (!loading && isNextPageAvailable) {
      store.dispatch(LoadHomeTransactionsPageAction(
        pageNumber:
            (transactions.length ~/ HomeTransactionListState.transactionsPerPage) + 1,
        transactionsPerPage: HomeTransactionListState.transactionsPerPage,
      ));
    }
  }

  // onRefresh() {
  //   store.dispatch(LoadDashboardDailyTotalAction());
  //   store.dispatch(LoadOvaralDailyAction());
  //   store.dispatch(LoadOveralWeeklyAction());
  //   store.dispatch(LoadOveralMonthlyAction());
  // }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.homeTransactionListState.loading,
      isNextPageAvailable: store.state.homeTransactionListState.isNextPageAvailable,
      transactions: store.state.homeTransactionListState.transactions,
      store: store,
      noError: store.state.allTransactionsState.error == null,
    );
  }
}
