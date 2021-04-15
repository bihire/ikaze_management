import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_daily_action.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_monthly_action.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> detailDailyTotalMiddleware() {
  return TypedMiddleware<AppState, DetailDailySumAction>(_loadDailyTotal());
}

_loadDailyTotal() {
  return (Store<AppState> store, DetailDailySumAction action,
      NextDispatcher next) {
    next(action);

    _loadDailyTotalAmount(action.productId).then(
      (itemsPage) {
        // print(action.productId);
        store.dispatch(DetailDailySumLoadedAction(itemsPage));
        store.dispatch(DetailOvaralDailyAction(action.productId));
        store.dispatch(DetailOveralWeeklyAction(action.productId));
        store.dispatch(DetailOveralMonthlyAction(action.productId));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorDetailDailyOccurredAction(exception));
    });
  };
}

Future<String> _loadDailyTotalAmount(String productId) async {
  var response = await http
      .get('http://10.1.10.185:5000/api/transactions/$productId/daily_total');
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData[0]['total_amount'];
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
