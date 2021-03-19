// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:meta/meta.dart';

@immutable
class DetailOveralWeeklyState {
  DetailOveralWeeklyState({
    this.loading,
    this.overalWeeklyData,
    this.error,
  });

  final bool loading;
  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory DetailOveralWeeklyState.initial() =>
      DetailOveralWeeklyState(loading: false, overalWeeklyData: const []);

  DetailOveralWeeklyState copyWith({
    loading,
    overalWeeklyData,
    error,
  }) {
    return DetailOveralWeeklyState(
      loading: loading ?? this.loading,
      overalWeeklyData: overalWeeklyData ?? this.overalWeeklyData,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "OvaraldailyState: isDataLoading = $loading, "
        "itemsOveralDailyTotal = $overalWeeklyData, "
        "error = $error.";
  }
}