import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_weekly_actions.dart';
// import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> detailOveralWeeklyMiddleware() {
  return TypedMiddleware<AppState, DetailOveralWeeklyAction>(
      _loadOveralWeekly());
}

_loadOveralWeekly() {
  return (Store<AppState> store, DetailOveralWeeklyAction action,
      NextDispatcher next) {
    next(action);

    _loadOveralWeeklyTotalAmount(action.productId).then(
      (items) {
        store.dispatch(DetailOveralWeeklyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralWeeklyTransactionModel>> _loadOveralWeeklyTotalAmount(
    String productId) async {
  var response = await http
      .get('http://192.168.43.56:5000/api/alltransactions/$productId/weekly');
  if (response.statusCode == 200) {
    // List<MoneyTransactionModel> listFromJson(List<dynamic> json) {
    //   return json == null ? List<MoneyTransactionModel>() : json.map((value) => MoneyTransactionModel.fromJson(value)).toList();
    // }
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => OveralWeeklyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
