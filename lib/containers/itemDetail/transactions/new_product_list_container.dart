import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/github_issue_list_item.dart';
import 'package:inventory_controller/models/money_transactions.dart';
// import 'package:inventory_controller/redux/actions/homePage/transactions/transactionList.dart';
import 'package:inventory_controller/redux/actions/itemDetail/transactions/new_transaction_list.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/appState/itemDetail/transactions/new_transactions_list.dart';
import 'package:redux/redux.dart';

class NewPageListContainer extends StatelessWidget {
  const NewPageListContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return index == vm.transactions.length
                ? Container(
                    width: width,
                    height: 80,
                    color: primaryLightColor,
                    child: Center(
                      child: vm.loading == true
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                backgroundColor: lightGreyColor,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    primaryColor),
                              ),
                            )
                          : Text(
                              'No transactions',
                              style: TextStyle(color: hardGreyColor),
                            ),
                    ),
                  )
                : MoneyTransactionModelListItem(
                    itemIndex: index, transaction: vm.transactions[index]);
          }, childCount: vm.transactions.length + 1),
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
          LoadNewTransactionsPageAction(
              pageNumber: 1,
              transactionsPerPage:
                  NewTransactionListState.transactionsPerPage),
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
      store.dispatch(LoadNewTransactionsPageAction(
        pageNumber: (transactions.length ~/ NewTransactionListState.transactionsPerPage) + 1,
        transactionsPerPage: NewTransactionListState.transactionsPerPage,
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
      loading: store.state.newTransactionListState.loading,
      isNextPageAvailable: store.state.newTransactionListState.isNextPageAvailable,
      transactions: store.state.newTransactionListState.transactions,
      store: store,
      noError: store.state.newTransactionListState.error == null,
    );
  }
}
