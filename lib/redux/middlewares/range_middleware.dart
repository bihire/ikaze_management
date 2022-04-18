import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:inventory_controller/redux/actions/range_actions.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Middleware<AppState> createAllTransactionsRangeMiddleware() {
  return TypedMiddleware<AppState, LoadTransactionsRangePageAction>(
      _loadItemsPage());
}

_loadItemsPage() {
  return (Store<AppState> store, LoadTransactionsRangePageAction action,
      NextDispatcher next) {
    next(action);

    if (action.pageNumber == 1) {
      store.dispatch(
          SetDateRangePageLoadedAction(action.fromDate, action.toDate));
      Future.wait([
        _loadRangeCount(action.fromDate, action.toDate),
        _loadRangeTransactions(action.pageNumber, action.transactionsPerPage),
      ]).then((itemsPage) {
        store.dispatch(TransactionsRangeCountLoadedAction((itemsPage as Map)[0]));
        store.dispatch(TransactionsRangePageLoadedAction((itemsPage as Map)[1]));
      }).catchError((exception, stacktrace) {
        store.dispatch(ErrorRangeOccurredAction(exception));
      });
    } else {
      _loadRangeTransactions(action.pageNumber, action.transactionsPerPage)
          .then((itemsPage) =>
              store.dispatch(TransactionsRangePageLoadedAction(itemsPage)))
          .catchError((exception, stacktrace) {
        store.dispatch(ErrorRangeOccurredAction(exception));
      });
    }
  };
}

Future<List<MoneyTransactionModel>> _loadRangeTransactions(
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

Future<RangeCountModel> _loadRangeCount(
    DateTime fromDate, DateTime toDate) async {
  var response = await http.get(
      Uri.parse('http://192.168.43.56:5000/api/transactions/range/count?fromdate=${Utils.formatToDate(fromDate)}&todate=${Utils.formatToDate(toDate)}'));
  if (response.statusCode == 200) {
    final jsonData = (json.decode(response.body))['data'] as List;
    return RangeCountModel.fromJson(jsonData[0]);
  } else {
    throw Exception('Error getting data, http code: ${response.statusCode}.');
  }
}
