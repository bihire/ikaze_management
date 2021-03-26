import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class SupplyTransactionListState {
  SupplyTransactionListState({
    this.loading,
    this.isNextPageAvailable,
    this.transactions,
    this.error,
  });

  final bool loading;
  final bool isNextPageAvailable;
  final List<MoneyTransactionModel> transactions;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory SupplyTransactionListState.initial() => SupplyTransactionListState(
        loading: false,
        isNextPageAvailable: false,
        transactions: const [],
      );

  SupplyTransactionListState copyWith({
    loading,
    isNextPageAvailable,
    transactions,
    error,
  }) {
    return SupplyTransactionListState(
      loading: loading ?? this.loading,
      isNextPageAvailable: isNextPageAvailable ?? this.isNextPageAvailable,
      transactions: transactions ?? this.transactions,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "SupplyTransactionListState: loading = $loading, "
        "isNextPageAvailable = $isNextPageAvailable, "
        "itemsLength = ${transactions.length}, "
        "error = $error.";
  }
}