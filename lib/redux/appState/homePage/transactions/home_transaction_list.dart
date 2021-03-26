import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class HomeTransactionListState {
  HomeTransactionListState({
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

  factory HomeTransactionListState.initial() => HomeTransactionListState(
        loading: false,
        isNextPageAvailable: false,
        transactions: const [],
      );

  HomeTransactionListState copyWith({
    loading,
    isNextPageAvailable,
    transactions,
    error,
  }) {
    return HomeTransactionListState(
      loading: loading ?? this.loading,
      isNextPageAvailable: isNextPageAvailable ?? this.isNextPageAvailable,
      transactions: transactions ?? this.transactions,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "HomeTransactionListState: loading = $loading, "
        "isNextPageAvailable = $isNextPageAvailable, "
        "itemsLength = ${transactions.length}, "
        "error = $error.";
  }
}