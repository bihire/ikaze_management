import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:inventory_controller/redux/actions/range_actions.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/appState/range_state.dart';
import 'package:inventory_controller/views/screens/RangeSearch/range_tramsactions.dart';
import 'package:redux/redux.dart';

class ProductRange extends StatefulWidget {
  @override
  _ProductRangeState createState() => _ProductRangeState();
}

class _ProductRangeState extends State<ProductRange> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return RangeTransactions(
          isDataLoading: vm.isRangeDataLoading,
          isNextPageAvailable: vm.isNextRangePageAvailable,
          transactions: vm.rangeTransactions,
          rangeCount: vm.rangeCount,
          rangeDate: vm.rangeDate,
          refresh: vm.onRefresh,
          onSearch: vm.onSearch,
          loadNextPage: vm.onLoadNextPage,
          noError: vm.noError,
        );
      },
      converter: _ViewModel.fromStore,
      // onDidChange: (vm) {
      //   print(vm.rangeDate);
      // },
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.isRangeDataLoading,
    this.isNextRangePageAvailable,
    this.rangeTransactions,
    this.rangeDate,
    this.rangeCount,
    this.store,
    this.noError,
  });

  final bool isRangeDataLoading;
  final bool isNextRangePageAvailable;
  final List<MoneyTransactionModel> rangeTransactions;
  final Store<AppState> store;
  final bool noError;
  final Map rangeDate;
  final RangeCountModel rangeCount;

  final DateTime fromDate = new DateTime.now();
  final DateTime toDate = new DateTime.now();

  void onLoadNextPage() {
    if (!isRangeDataLoading && isNextRangePageAvailable) {
      store.dispatch(LoadTransactionsRangePageAction(
          pageNumber: (rangeTransactions.length ~/
                  TransactionRangeState.transactionsPerPage) +
              1,
          transactionsPerPage: TransactionRangeState.transactionsPerPage,
          fromDate: fromDate,
          toDate: toDate));
    }
  }

  void onRefresh(DateTime fromDate, DateTime toDate) {
    store.dispatch(LoadTransactionsRangePageAction(
        pageNumber: 1,
        transactionsPerPage: TransactionRangeState.transactionsPerPage,
        fromDate: fromDate,
        toDate: toDate));
  }

  void onSearch({fromDate, toDate}) {
    return store.dispatch(LoadTransactionsRangePageAction(
        pageNumber: 1,
        transactionsPerPage: TransactionRangeState.transactionsPerPage,
        fromDate: fromDate,
        toDate: toDate));
  }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isRangeDataLoading: store.state.transactionRangeState.isRangeDataLoading,
      isNextRangePageAvailable:
          store.state.transactionRangeState.isNextRangePageAvailable,
      rangeTransactions: store.state.transactionRangeState.rangeTransactions,
      rangeDate: store.state.transactionRangeState.rangeDate,
      rangeCount: store.state.transactionRangeState.rangeCount,
      store: store,
      noError: store.state.transactionRangeState.rangeError == null,
    );
  }
}
