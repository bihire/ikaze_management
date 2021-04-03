import 'package:flutter/material.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/productList/product_list.dart';
import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/actions/itemDetail/transactions/new_transaction_list.dart';
import 'package:inventory_controller/redux/appState/itemDetail/transactions/new_transactions_list.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';

class NewDetailContainer extends StatefulWidget {
  final ProductInfoModel productInfo;
  NewDetailContainer({
    this.productInfo,
  });
  @override
  _NewDetailContainerState createState() => _NewDetailContainerState();
}

class _NewDetailContainerState extends State<NewDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return NewEntryScreen(
          productInfo: widget.productInfo,
          loading: vm.loading,
          isNextPageAvailable: vm.isNextPageAvailabe,
          transactions: vm.transactions,
          loadNextPage: vm.onLoadNextPage,
          refresh: vm.onRefresh,
          error: vm.error,
          dailyTotal: vm.dailyTotal,
          // productInfo: widget.productInfo
          );
      },
      converter: _ViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        store.dispatch(
          DetailDailySumAction('${widget.productInfo.productId}'),
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
    this.isNextPageAvailabe,
    this.transactions
  });

  final bool loading;
  final bool isNextPageAvailabe;
  final String dailyTotal;
  final List<MoneyTransactionModel> transactions;
  final Store<AppState> store;
  final bool error;

    void onLoadNextPage(String productId) {
      store.dispatch(LoadNewTransactionsPageAction(
        pageNumber:
            (transactions.length ~/ NewTransactionListState.transactionsPerPage) + 1,
        transactionsPerPage: NewTransactionListState.transactionsPerPage,
        productId: productId
      ));
  }

  void onRefresh() {
    // store.dispatch(
    //   LoadTransactionsPageAction(
    //       pageNumber: 1,
    //       transactionsPerPage: NewTransactionListState.transactionsPerPage),
    // );
  }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loading: store.state.detailDailySalesTotalState.loading,
      dailyTotal: store.state.detailDailySalesTotalState.dailyTotal,
      store: store,
      transactions: store.state.newTransactionListState.transactions,
      isNextPageAvailabe: store.state.newTransactionListState.isNextPageAvailable,
      error: store.state.detailDailySalesTotalState.error == null,
    );
  }
}
