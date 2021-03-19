// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:meta/meta.dart';

@immutable
class DetailOveralMonthlyState {
  DetailOveralMonthlyState({
    this.loading,
    this.overalMonthlyData,
    this.error,
  });

  final bool loading;
  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final Exception error;

  static const int transactionsPerPage = 10;

  factory DetailOveralMonthlyState.initial() =>
      DetailOveralMonthlyState(loading: false, overalMonthlyData: const []);

  DetailOveralMonthlyState copyWith({
    loading,
    overalMonthlyData,
    error,
  }) {
    return DetailOveralMonthlyState(
      loading: loading ?? this.loading,
      overalMonthlyData: overalMonthlyData ?? this.overalMonthlyData,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "OvaraldailyState: isDataLoading = $loading, "
        "itemsOveralDailyTotal = $overalMonthlyData, "
        "error = $error.";
  }
}