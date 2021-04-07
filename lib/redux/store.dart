import 'package:redux/redux.dart';

import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/middlewares/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_daily_middleware.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_monthly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/homePage/overal_weekly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/homePage/transactions/home_transactions_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_daily_total.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_daily_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_monthly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/detail_overal_weekly_middleware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/transactions/new_transactions_middlware.dart';
import 'package:inventory_controller/redux/middlewares/itemDetail/transactions/supply_transactions_middleware.dart';
import 'package:inventory_controller/redux/middlewares/popup_middleware.dart';
import 'package:inventory_controller/redux/middlewares/productList/product_list.dart';
import 'package:inventory_controller/redux/middlewares/range_middleware.dart';
import 'package:inventory_controller/redux/reducers/app_reducer.dart';
import 'package:inventory_controller/redux/middlewares/all_transactins_middlewares.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      createAllTransactionsMiddleware(),
      homeTransactionsMiddleware(),
      newTransactionsMiddleware(),
      supplyTransactionsMiddleware(),
      dashboardDailyTotalMiddleware(),
      overalDailyTransactionsMiddleware(),
      overalWeeklyTransactionsMiddleware(),
      createAllTransactionsRangeMiddleware(),
      popupMiddleware(),
      overalMonthlyTransactionsMiddleware(),
      detailDailyTotalMiddleware(),
      detailOveralDailyTotalMiddleware(),
      detailOveralMonthlyMiddleware(),
      detailOveralWeeklyMiddleware(),
      productListMiddleware()
    ]
  );
}