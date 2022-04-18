import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_daily_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> detailOveralDailyTotalMiddleware() {
  return TypedMiddleware<AppState, DetailOvaralDailyAction>(
      _loadDetailOveralDailyTotal());
}

_loadDetailOveralDailyTotal() {
  return (Store<AppState> store, DetailOvaralDailyAction action,
      NextDispatcher next) {
    next(action);

    _loadDetailOveralDailyTotalAmount(action.productId).then(
      (items) {
        // print(action.productId);
        store.dispatch(DetailOvaralDailyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralDailyTransactionModel>> _loadDetailOveralDailyTotalAmount(
    String productId) async {
  var response = await http
      .get(Uri.parse('http://192.168.43.56:5000/api/alltransactions/$productId/daily'));
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => OveralDailyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
