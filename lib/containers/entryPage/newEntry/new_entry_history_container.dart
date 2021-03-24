import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/components/sticky_header_list.dart';
// import 'package:flutter/material.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/actions/all_transactions_actions.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
import 'package:redux/redux.dart';

class NewEntryContainer extends StatelessWidget {
  const NewEntryContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return NewEntryScreen(
          loading: vm.isDataLoading,
          isNextPageAvailable: vm.isNextPageAvailable,
          transactions: vm.transactions,
          refresh: vm.onRefresh,
          loadNextPage: vm.onLoadNextPage,
          noError: vm.noError,
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadTransactionsPageAction(
              pageNumber: 1,
              transactionsPerPage: TransactionState.transactionsPerPage),
        );
      },
    );
  }
}


class _ViewModel {
  _ViewModel({
    this.isDataLoading,
    this.isNextPageAvailable,
    this.transactions,
    this.store,
    this.noError,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Store<AppState> store;
  final bool noError;

  void onLoadNextPage() {
    if (!isDataLoading && isNextPageAvailable) {
      store.dispatch(LoadTransactionsPageAction(
        pageNumber:
            (transactions.length ~/ TransactionState.transactionsPerPage) + 1,
        transactionsPerPage: TransactionState.transactionsPerPage,
      ));
    }
  }

  void onRefresh() {
    store.dispatch(
      LoadTransactionsPageAction(
          pageNumber: 1,
          transactionsPerPage: TransactionState.transactionsPerPage),
    );
  }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isDataLoading: store.state.allTransactionsState.isDataLoading,
      isNextPageAvailable: store.state.allTransactionsState.isNextPageAvailable,
      transactions: store.state.allTransactionsState.transactions,
      store: store,
      noError: store.state.allTransactionsState.error == null,
    );
  }
}