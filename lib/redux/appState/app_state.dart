import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/redux/appState/homePage/dashboard_daily_total_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_daily_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_monthly_state.dart';
import 'package:inventory_controller/redux/appState/homePage/overal_weekly_state.dart';
import 'package:inventory_controller/redux/appState/itemDetail/daily_detail_sum.dart';
import 'package:inventory_controller/redux/appState/popup_state.dart';
import 'package:inventory_controller/redux/appState/productList/product_list.dart';
import 'package:inventory_controller/redux/appState/range_state.dart';
import 'package:meta/meta.dart';

import 'homePage/transactions/home_transaction_list.dart';
import 'itemDetail/charts/detail_overal_daily_state.dart';
import 'itemDetail/charts/detail_overal_monthly_state.dart';
import 'itemDetail/charts/detail_overal_weekly_state.dart';
import 'itemDetail/transactions/new_transactions_list.dart';
import 'itemDetail/transactions/supply_transactions_list.dart';

@immutable
class AppState {
  final TransactionState allTransactionsState;
  final HomeTransactionListState homeTransactionListState;
  final DashoardDailyTotalState dashboardDailyTotalState;
  final OvaraldailyState ovaraldailyState;
  final OveralWeeklyState overalWeeklyState;
  final OveralMonthlyState overalMonthlyState;
  final TransactionRangeState transactionRangeState;
  final PopupState popupState;

  //===========This is the state for detail page=============

  final DetailDailySalesTotalState detailDailySalesTotalState;
  final DetailOvaraldailyState detailOveraldailyState;
  final DetailOveralWeeklyState detailOveralWeeklyState;
  final DetailOveralMonthlyState detailOveralMonthlyState;
  final NewTransactionListState newTransactionListState;
  final SupplyTransactionListState supplyTransactionListState;
  //===========This the state for product page================
  final ProductListState productListState;

  AppState({
    @required this.homeTransactionListState,
    @required this.allTransactionsState,
    @required this.dashboardDailyTotalState,
    @required this.ovaraldailyState,
    @required this.overalWeeklyState,
    @required this.overalMonthlyState,
    @required this.transactionRangeState,
    @required this.popupState,
//===========================================================
    @required this.detailDailySalesTotalState,
    @required this.detailOveraldailyState,
    @required this.detailOveralWeeklyState,
    @required this.detailOveralMonthlyState,
    @required this.newTransactionListState,
    @required this.supplyTransactionListState,
//============================================================
    @required this.productListState
  });

  factory AppState.initial() {
    return AppState(
        allTransactionsState: TransactionState.initial(),
        homeTransactionListState: HomeTransactionListState.initial(),
        dashboardDailyTotalState: DashoardDailyTotalState.initial(),
        ovaraldailyState: OvaraldailyState.initial(),
        overalWeeklyState: OveralWeeklyState.initial(),
        overalMonthlyState: OveralMonthlyState.initial(),
        transactionRangeState: TransactionRangeState.initial(),
        popupState: PopupState.initial(),
//===========================Detail Product=============================================
        detailDailySalesTotalState: DetailDailySalesTotalState.initial(),
        detailOveraldailyState: DetailOvaraldailyState.initial(),
        detailOveralWeeklyState: DetailOveralWeeklyState.initial(),
        detailOveralMonthlyState: DetailOveralMonthlyState.initial(),
        newTransactionListState: NewTransactionListState.initial(),
        supplyTransactionListState: SupplyTransactionListState.initial(),
//===========================Product List===============================================
        productListState: ProductListState.initial());
  }

  AppState copyWith({TransactionState allTransactionsState}) {
    return AppState(
      allTransactionsState: allTransactionsState ?? this.allTransactionsState,
      homeTransactionListState: homeTransactionListState ?? this.homeTransactionListState,
      dashboardDailyTotalState:
          dashboardDailyTotalState ?? this.dashboardDailyTotalState,
      ovaraldailyState: ovaraldailyState ?? this.ovaraldailyState,
      overalWeeklyState: overalWeeklyState ?? this.overalWeeklyState,
      overalMonthlyState: overalMonthlyState ?? this.overalMonthlyState,
      transactionRangeState:
          transactionRangeState ?? this.transactionRangeState,
      popupState: popupState ?? this.popupState,
//==========================================================================================
      detailDailySalesTotalState:
          detailDailySalesTotalState ?? this.detailDailySalesTotalState,
      detailOveraldailyState:
          detailOveraldailyState ?? this.detailOveraldailyState,
      detailOveralWeeklyState:
          detailOveralWeeklyState ?? this.detailOveralWeeklyState,
      detailOveralMonthlyState:
          detailOveralMonthlyState ?? this.detailOveralMonthlyState,
      newTransactionListState: newTransactionListState ?? this.newTransactionListState,
      supplyTransactionListState: supplyTransactionListState ?? this.supplyTransactionListState,
      
//==========================================================================================
      productListState: productListState ?? this.productListState,
    );
  }
}
