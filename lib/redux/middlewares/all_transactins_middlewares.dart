import 'dart:convert';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/all_transactions_actions.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> createAllTransactionsMiddleware() {
  return TypedMiddleware<AppState, LoadTransactionsPageAction>(
      _loadItemsPage());
}

_loadItemsPage() {
  return (Store<AppState> store, LoadTransactionsPageAction action,
      NextDispatcher next) {
    next(action);

    _loadFlutterGithubIssues(action.pageNumber, action.transactionsPerPage)
        .then(
      (itemsPage) {
        store.dispatch(TransactionsPageLoadedAction(itemsPage));
      },
    ).catchError((exception, stacktrace) {
      store.dispatch(ErrorOccurredAction(exception));
    });
  };
}

Future<List<MoneyTransactionModel>> _loadFlutterGithubIssues(
    int page, int perPage) async {
  var response = await http.get(
      Uri.parse('http://192.168.43.56:5000/api/transactions?page=$page&numberOfRows=$perPage'));
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return jsonData
        .map((item) => MoneyTransactionModel.fromJson(item))
        .toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
