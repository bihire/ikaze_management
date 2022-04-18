import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class TransactionState {
  TransactionState({
    required this.isDataLoading,
    required this.isNextPageAvailable,
    required this.transactions,
    this.error,
  });

  final bool isDataLoading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Exception? error;

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