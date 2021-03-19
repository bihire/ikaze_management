// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:meta/meta.dart';

@immutable
class DetailDailySalesTotalState {
  DetailDailySalesTotalState({
    this.isDataLoading,
    this.dailyTotal,
    this.error,
  });

  final bool isDataLoading;
  final String dailyTotal;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory DetailDailySalesTotalState.initial() =>
      DetailDailySalesTotalState(isDataLoading: false, dailyTotal: '');

  DetailDailySalesTotalState copyWith({
    isDataLoading,
    dailyTotal,
    error,
  }) {
    return DetailDailySalesTotalState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      dailyTotal: dailyTotal ?? this.dailyTotal,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "DetailDailySalesTotalState: isDataLoading = $isDataLoading, "
        "itemsDailTotal = $dailyTotal, "
        "error = $error.";
  }
}
