import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/homePage/dashboard_daily_total_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_daily_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_monthly_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_weekly_state.dart';
import 'package:inventory_controller/redux/appState/popup_state.dart';
import 'package:inventory_controller/redux/appState/range_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final TransactionState allTransactionsState;
  final DashoardDailyTotalState dashboardDailyTotalState;
  final OvaraldailyState ovaraldailyState;
  final OveralWeeklyState overalWeeklyState;
  final OveralMonthlyState overalMonthlyState;
  final TransactionRangeState transactionRangeState;
  final PopupState popupState;

  AppState({
    @required this.allTransactionsState,
    @required this.dashboardDailyTotalState,
    @required this.ovaraldailyState,
    @required this.overalWeeklyState,
    @required this.overalMonthlyState,
    @required this.transactionRangeState,
    @required this.popupState,
  });

  factory AppState.initial() {
    return AppState(
        allTransactionsState: TransactionState.initial(),
        dashboardDailyTotalState: DashoardDailyTotalState.initial(),
        ovaraldailyState: OvaraldailyState.initial(),
        overalWeeklyState: OveralWeeklyState.initial(),
        overalMonthlyState: OveralMonthlyState.initial(),
        transactionRangeState: TransactionRangeState.initial(),
        popupState: PopupState.initial());
  }

  AppState copyWith({TransactionState allTransactionsState}) {
    return AppState(
      allTransactionsState: allTransactionsState ?? this.allTransactionsState,
      dashboardDailyTotalState: dashboardDailyTotalState ?? this.dashboardDailyTotalState,
      ovaraldailyState: ovaraldailyState ?? this.ovaraldailyState,
      overalWeeklyState: overalWeeklyState ?? this.overalWeeklyState,
      overalMonthlyState: overalMonthlyState ?? this.overalMonthlyState,
      transactionRangeState: transactionRangeState ?? this.transactionRangeState,
      popupState: popupState ?? this.popupState,
    );
  }
}
