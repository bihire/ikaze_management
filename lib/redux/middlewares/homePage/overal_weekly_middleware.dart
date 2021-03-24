import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/redux/actions/homePage/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> overalWeeklyTransactionsMiddleware() {
  return TypedMiddleware<AppState, LoadOveralWeeklyAction>(_loadOveralWeekly());
}

_loadOveralWeekly() {
  return (Store<AppState> store, LoadOveralWeeklyAction action,
      NextDispatcher next) {
    next(action);

    _loadOveralWeeklyTotalAmount().then(
      (items) {
        store.dispatch(OveralWeeklyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralWeeklyTransactionModel>> _loadOveralWeeklyTotalAmount() async {
  var response = await http
      .get('http://172.17.2.129:5000/api/alltransactions/all/weekly');
  if (response.statusCode == 200) {
    // List<MoneyTransactionModel> listFromJson(List<dynamic> json) {
    //   return json == null ? List<MoneyTransactionModel>() : json.map((value) => MoneyTransactionModel.fromJson(value)).toList();
    // }
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData.map((item) => OveralWeeklyTransactionModel.fromJson(item)).toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
