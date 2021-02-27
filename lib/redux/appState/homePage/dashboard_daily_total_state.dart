// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class DashoardDailyTotalState {
  DashoardDailyTotalState({
    this.isDataLoading,
    this.dailTotal,
    this.error,
  });

  final bool isDataLoading;
  final String dailTotal;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory DashoardDailyTotalState.initial() =>
      DashoardDailyTotalState(isDataLoading: false, dailTotal: '');

  DashoardDailyTotalState copyWith({
    isDataLoading,
    dailTotal,
    error,
  }) {
    return DashoardDailyTotalState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      dailTotal: dailTotal ?? this.dailTotal,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "DashoardDailyTotalState: isDataLoading = $isDataLoading, "
        "itemsDailTotal = $dailTotal, "
        "error = $error.";
  }
}
