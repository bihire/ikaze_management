import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class NewTransactionListState {
  NewTransactionListState({
    required this.loading,
    required this.isNextPageAvailable,
    required this.transactions,
    this.error,
  });

  final bool loading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Exception? error;

  static const int transactionsPerPage = 10;

  factory NewTransactionListState.initial() => NewTransactionListState(
        loading: false,
        isNextPageAvailable: false,
        transactions: const [],
      );

  NewTransactionListState copyWith({
    loading,
    isNextPageAvailable,
    transactions,
    error,
  }) {
    return NewTransactionListState(
      loading: loading ?? this.loading,
      isNextPageAvailable: isNextPageAvailable ?? this.isNextPageAvailable,
      transactions: transactions ?? this.transactions,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "NewTransactionListState: loading = $loading, "
        "isNextPageAvailable = $isNextPageAvailable, "
        "itemsLength = ${transactions.length}, "
        "error = $error.";
  }
}