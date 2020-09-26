import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

// @immutable
// class TransactionState {
//   final bool isError;
//   final bool isLoading;
//   final bool paginate;
//   final List<MoneyTransactionModel> transactions;

//   TransactionState({
//     this.isError,
//     this.isLoading,
//     this.paginate,
//     this.transactions,
//   });

//   factory TransactionState.initial() => TransactionState(
//         isLoading: false,
//         paginate: false,
//         isError: false,
//         transactions: const [],
//       );

//   TransactionState copyWith({
//     @required bool isError,
//     @required bool isLoading,
//     bool paginate,
//     @required List<MoneyTransactionModel> transactions,
//   }) {
//     return TransactionState(
//       isError: isError ?? this.isError,
//       isLoading: isLoading ?? this.isLoading,
//       paginate: paginate ?? this.paginate,
//       transactions: transactions ?? this.transactions,
//     );
//   }
// }

// import 'package:flutter_redux_infinite_list/models/github_issue.dart';
@immutable
class TransactionState {
  TransactionState({
    this.isDataLoading,
    this.isNextPageAvailable,
    this.transactions,
    this.error,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory TransactionState.initial() => TransactionState(
        isDataLoading: false,
        isNextPageAvailable: false,
        transactions: const [],
      );

  TransactionState copyWith({
    isDataLoading,
    isNextPageAvailable,
    transactions,
    error,
  }) {
    return TransactionState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      isNextPageAvailable: isNextPageAvailable ?? this.isNextPageAvailable,
      transactions: transactions ?? this.transactions,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "TransactionState: isDataLoading = $isDataLoading, "
        "isNextPageAvailable = $isNextPageAvailable, "
        "itemsLength = ${transactions.length}, "
        "error = $error.";
  }
}