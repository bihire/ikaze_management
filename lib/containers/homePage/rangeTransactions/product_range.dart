import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_controller/blocs/rangeSearch/rangesearch_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/views/RangeSearch/range_tramsactions.dart';

class ProductRange extends StatefulWidget {
  @override
  _ProductRangeState createState() => _ProductRangeState();
}

class _ProductRangeState extends State<ProductRange> {
  late ScrollController _scrollController;
  final RangesearchBloc rangesearchBloc = RangesearchBloc();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    rangesearchBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void onSearch(DateTime fromDate, DateTime toDate) {
    print(fromDate);
    print(toDate);
    rangesearchBloc.add(LoadRangesearch(fromDate, toDate));
    // return store.dispatch(LoadTransactionsRangePageAction(
    //     pageNumber: 1,
    //     transactionsPerPage: TransactionRangeState.transactionsPerPage,
    //     fromDate: fromDate,
    //     toDate: toDate));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RangesearchBloc, RangesearchState>(
      bloc: rangesearchBloc,
      builder: (context, state) {
        return RangeTransactions(
          loading: state.status,
          isNextpage: state.isNextpage,
          transactions: state.rangeTransactions,
          rangeCount: state.rangeCount,
          rangeDate: state.rangeDate,
          // refresh: vm.onRefresh,
          onSearch: onSearch,
          // loadNextPage: vm.onLoadNextPage,
          error: state.error,
        );
      },
    );
  }
}

// class _ViewModel {
//   _ViewModel({
//     this.isRangeDataLoading,
//     this.isNextRangePageAvailable,
//     this.rangeTransactions,
//     this.rangeDate,
//     this.rangeCount,
//     this.store,
//     this.noError,
//   });

//   final bool isRangeDataLoading;
//   final bool isNextRangePageAvailable;
//   final List<MoneyTransactionModel> rangeTransactions;
//   final Store<AppState> store;
//   final bool noError;
//   final Map rangeDate;
//   final RangeCountModel rangeCount;

//   final DateTime fromDate = new DateTime.now();
//   final DateTime toDate = new DateTime.now();

//   void onLoadNextPage() {
//     if (!isRangeDataLoading && isNextRangePageAvailable) {
//       store.dispatch(LoadTransactionsRangePageAction(
//           pageNumber: (rangeTransactions.length ~/
//                   TransactionRangeState.transactionsPerPage) +
//               1,
//           transactionsPerPage: TransactionRangeState.transactionsPerPage,
//           fromDate: fromDate,
//           toDate: toDate));
//     }
//   }

//   void onRefresh(DateTime fromDate, DateTime toDate) {
//     store.dispatch(LoadTransactionsRangePageAction(
//         pageNumber: 1,
//         transactionsPerPage: TransactionRangeState.transactionsPerPage,
//         fromDate: fromDate,
//         toDate: toDate));
//   }

//   void onSearch({fromDate, toDate}) {
//     return store.dispatch(LoadTransactionsRangePageAction(
//         pageNumber: 1,
//         transactionsPerPage: TransactionRangeState.transactionsPerPage,
//         fromDate: fromDate,
//         toDate: toDate));
//   }

//   static _ViewModel fromStore(Store<AppState> store) {
//     return _ViewModel(
//       isRangeDataLoading: store.state.transactionRangeState.isRangeDataLoading,
//       isNextRangePageAvailable:
//           store.state.transactionRangeState.isNextRangePageAvailable,
//       rangeTransactions: store.state.transactionRangeState.rangeTransactions,
//       rangeDate: store.state.transactionRangeState.rangeDate,
//       rangeCount: store.state.transactionRangeState.rangeCount,
//       store: store,
//       noError: store.state.transactionRangeState.rangeError == null,
//     );
//   }
// }
