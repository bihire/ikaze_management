import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_monthly_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> overalMonthlyTransactionsMiddleware() {
  return TypedMiddleware<AppState, LoadOveralMonthlyAction>(
      _loadOveralMonthly());
}

_loadOveralMonthly() {
  return (Store<AppState> store, LoadOveralMonthlyAction action,
      NextDispatcher next) {
    next(action);

    _loadOveralMonthlyTotalAmount().then(
      (items) {
        store.dispatch(OveralMonthlyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralMonthlyTransactionModel>>
    _loadOveralMonthlyTotalAmount() async {
  var response =
      await http.get('http://172.17.2.35:5000/api/alltransactions/all/monthly');
  if (response.statusCode == 200) {
    // List<MoneyTransactionModel> listFromJson(List<dynamic> json) {
    //   return json == null ? List<MoneyTransactionModel>() : json.map((value) => MoneyTransactionModel.fromJson(value)).toList();
    // }
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => OveralMonthlyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
