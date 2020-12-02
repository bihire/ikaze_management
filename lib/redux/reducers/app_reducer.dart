import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/reducers/all_transactions_reducer.dart';
import 'package:inventory_controller/redux/reducers/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/reducers/overal_daily_reducer.dart';
import 'package:inventory_controller/redux/reducers/popup_reducer.dart';
import 'package:inventory_controller/redux/reducers/range_transactions_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        allTransactionsState: allTransactionsReducer(state.allTransactionsState, action),
        dashboardDailyTotalState: dailyDashboardTotalReducer(state.dashboardDailyTotalState, action),
        ovaraldailyState: overalDailyTransactionsReducer(state.ovaraldailyState, action),
        transactionRangeState: allTransactionsRangeReducer(state.transactionRangeState, action),
        popupState: popupReducer(state.popupState, action),
    );