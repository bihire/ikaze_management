// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:meta/meta.dart';

@immutable
class OveralWeeklyState {
  OveralWeeklyState({
    required this.loading,
    required this.overalWeeklyData,
    this.error,
  });

  final bool loading;
  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final Exception? error;

  static const int transactionsPerPage = 10;

  factory OveralWeeklyState.initial() =>
      OveralWeeklyState(loading: false, overalWeeklyData: const []);

  OveralWeeklyState copyWith({
    loading,
    overalWeeklyData,
    error,
  }) {
    return OveralWeeklyState(
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