// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:meta/meta.dart';

@immutable
class DetailOvaraldailyState {
  DetailOvaraldailyState({
    required this.isDataLoading,
    required this.overalDailydata,
    this.error,
  });

  final bool isDataLoading;
  final List<OveralDailyTransactionModel> overalDailydata;
  final Exception? error;

  static const int transactionsPerPage = 10;

  factory DetailOvaraldailyState.initial() =>
      DetailOvaraldailyState(isDataLoading: false, overalDailydata: const []);

  DetailOvaraldailyState copyWith({
    isDataLoading,
    overalDailydata,
    error,
  }) {
    return DetailOvaraldailyState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      overalDailydata: overalDailydata ?? this.overalDailydata,
      error: error != this.error ? error : this.error,
    );
  }

  @override
  String toString() {
    return "OvaraldailyState: isDataLoading = $isDataLoading, "
        "itemsOveralDailyTotal = $overalDailydata, "
        "error = $error.";
  }
}