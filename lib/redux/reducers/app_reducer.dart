import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/reducers/all_transactions_reducer.dart';
import 'package:inventory_controller/redux/reducers/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/reducers/homePage/overal_daily_reducer.dart';
import 'package:inventory_controller/redux/reducers/homePage/overal_weekly_reducer.dart';
import 'package:inventory_controller/redux/reducers/itemDetail/detail_daily_total.dart';
import 'package:inventory_controller/redux/reducers/popup_reducer.dart';
import 'package:inventory_controller/redux/reducers/range_transactions_reducer.dart';

import 'homePage/overal_monthly_reducer.dart';
import 'itemDetail/charts/detail_overal_daily_reducer.dart';
import 'itemDetail/charts/detail_overal_monthly_reducer.dart';
import 'itemDetail/charts/detail_overal_weekly_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        allTransactionsState: allTransactionsReducer(state.allTransactionsState, action),
        dashboardDailyTotalState: dailyDashboardTotalReducer(state.dashboardDailyTotalState, action),
        ovaraldailyState: overalDailyTransactionsReducer(state.ovaraldailyState, action),
        overalWeeklyState: overalWeeklyTransactionsReducer(state.overalWeeklyState, action),
        overalMonthlyState: overalMonthlyTransactionsReducer(state.overalMonthlyState, action),
        transactionRangeState: allTransactionsRangeReducer(state.transactionRangeState, action),
        popupState: popupReducer(state.popupState, action),
//=====================================================================================================
        detailDailySalesTotalState: detailDailySalesTotalReducer(state.detailDailySalesTotalState, action),
        detailOveraldailyState: detailOveralDailyReducer(state.detailOveraldailyState, action),
        detailOveralWeeklyState: detailOveralWeeklyReducer(state.detailOveralWeeklyState, action),
        detailOveralMonthlyState: detailOveralMonthlyReducer(state.detailOveralMonthlyState, action),
    );