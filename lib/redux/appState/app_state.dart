import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/dashboard_daily_total_state.dart';
import 'package:inventory_controller/redux/appState/overal_daily_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final TransactionState allTransactionsState;
  final DashoardDailyTotalState dashboardDailyTotalState;
  final OvaraldailyState ovaraldailyState;

  AppState({
    @required this.allTransactionsState,
    @required this.dashboardDailyTotalState,
    @required this.ovaraldailyState,
  });

  factory AppState.initial() {
    return AppState(
        allTransactionsState: TransactionState.initial(),
        dashboardDailyTotalState: DashoardDailyTotalState.initial(),
        ovaraldailyState: OvaraldailyState.initial());
  }

  AppState copyWith({TransactionState allTransactionsState}) {
    return AppState(
      allTransactionsState: allTransactionsState ?? this.allTransactionsState,
      dashboardDailyTotalState: dashboardDailyTotalState ?? this.dashboardDailyTotalState,
      ovaraldailyState: ovaraldailyState ?? this.ovaraldailyState,
    );
  }
}
