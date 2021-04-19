import 'dart:convert';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/actions/homePage/transactions/transactionList.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> homeTransactionsMiddleware() {
  return TypedMiddleware<AppState, LoadHomeTransactionsPageAction>(
      _loadItemsPage());
}

_loadItemsPage() {
  return (Store<AppState> store, LoadHomeTransactionsPageAction action,
      NextDispatcher next) {
    next(action);

    _loadFlutterGithubIssues(action.pageNumber, action.transactionsPerPage)
        .then(
      (itemsPage) {
        store.dispatch(HomeTransactionsPageLoadedAction(itemsPage));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<MoneyTransactionModel>> _loadFlutterGithubIssues(
    int page, int perPage) async {
  var response = await http.get(
      'http://192.168.137.97:5000/api/transactions/all?page=$page&numberOfRows=$perPage');
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => MoneyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
