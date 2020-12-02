import 'dart:convert';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/all_transactions_actions.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createAllTransactionsMiddleware() {
  return [
    TypedMiddleware<AppState, LoadTransactionsPageAction>(
        _loadItemsPage()),
    // LoggingMiddleware.printer(),
  ];
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
      'http://192.168.137.133:5000/api/auth/transactions?page=$page&numberOfRows=$perPage');
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return  jsonData.map((item) => MoneyTransactionModel.fromJson(item)).toList();
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
