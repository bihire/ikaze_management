import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_monthly_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> detailOveralMonthlyMiddleware() {
  return TypedMiddleware<AppState, DetailOveralMonthlyAction>(
      _loadOveralMonthly());
}

_loadOveralMonthly() {
  return (Store<AppState> store, DetailOveralMonthlyAction action,
      NextDispatcher next) {
    next(action);

    _loadOveralMonthlyTotalAmount(action.productId).then(
      (items) {
        store.dispatch(DetailOveralMonthlyLoadedAction(items));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<OveralMonthlyTransactionModel>> _loadOveralMonthlyTotalAmount(
    String productId) async {
  var response = await http
      .get('http://192.168.43.56:5000/api/alltransactions/$productId/monthly');
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
