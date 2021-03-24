// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class DetailDailySalesTotalState {
  DetailDailySalesTotalState({
    this.loading,
    this.dailyTotal,
    this.error,
  });

  final bool loading;
  final String dailyTotal;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory DetailDailySalesTotalState.initial() =>
      DetailDailySalesTotalState(loading: false, dailyTotal: '');

  DetailDailySalesTotalState copyWith({
    loading,
    dailyTotal,
    error,
  }) {
    return DetailDailySalesTotalState(
      loading: loading ?? this.loading,
      dailyTotal: dailyTotal ?? this.dailyTotal,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "DetailDailySalesTotalState: loading = $loading, "
        "itemsDailTotal = $dailyTotal, "
        "error = $error.";
  }
}
