import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_daily_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> overalDailyTransactionsMiddleware() {
  return TypedMiddleware<AppState, LoadOvaralDailyAction>(
      _loadOveralDailyTotal());
}

_loadOveralDailyTotal() {
  return (Store<AppState> store, LoadOvaralDailyAction action,
      NextDispatcher next) {
    next(action);

    _loadOveralDailyTotalAmount().then(
      (items) {
        store.dispatch(OvaralDailyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      print('======================================= this is the error ====================================');
      print(exception);
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralDailyTransactionModel>> _loadOveralDailyTotalAmount() async {
  var response =
      await http.get('http://192.168.137.97:5000/api/alltransactions/daily');
  if (response.statusCode == 200) {
    // List<MoneyTransactionModel> listFromJson(List<dynamic> json) {
    //   return json == null ? List<MoneyTransactionModel>() : json.map((value) => MoneyTransactionModel.fromJson(value)).toList();
    // }
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => OveralDailyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
