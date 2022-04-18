import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/actions/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> dashboardDailyTotalMiddleware() {
  return TypedMiddleware<AppState, LoadDashboardDailyTotalAction>(
      _loadDailyTotal());
}

_loadDailyTotal() {
  return (Store<AppState> store, LoadDashboardDailyTotalAction action,
      NextDispatcher next) {
    next(action);

    _loadDailyTotalAmount().then(
      (itemsPage) {
        store.dispatch(DashboardDailyTotalLoadedAction(itemsPage));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<String> _loadDailyTotalAmount() async {
  var response = await http
      .get(Uri.parse('http://192.168.43.56:5000/api/transactions/all/daily_total'));
  if (response.statusCode == 200) {
    // List<MoneyTransactionModel> listFromJson(List<dynamic> json) {
    //   return json == null ? List<MoneyTransactionModel>() : json.map((value) => MoneyTransactionModel.fromJson(value)).toList();
    // }
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData[0]['total_amount'];
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
