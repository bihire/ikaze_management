import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/itemDetail/transactions/supply_transaction_list.dart';
import 'package:inventory_controller/redux/appState/itemDetail/transactions/supply_transactions_list.dart';

import 'package:redux/redux.dart';

SupplyTransactionListState supplyTransactionReducer(
    SupplyTransactionListState state, action) {
  return state.copyWith(
    loading: _loadingReducer(state.loading, action),
    isNextPageAvailable:
        _isNextPageAvailableReducer(state.isNextPageAvailable, action),
    transactions: _transactionsReducer(state.transactions, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadSupplyTransactionsPageAction>(_loadingStartedReducer),
  TypedReducer<bool, SupplyTransactionsPageLoadedAction>(_loadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_loadingFinishedReducer),
]);

bool _loadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _loadingFinishedReducer(bool _, dynamic action) {
  return false;
}

bool _isNextPageAvailableReducer(bool isNextPageAvailable, dynamic action) {
  return (action is SupplyTransactionsPageLoadedAction)
      ? action.transactionsPage.length ==
          SupplyTransactionListState.transactionsPerPage
      : isNextPageAvailable;
}

List<MoneyTransactionModel> _transactionsReducer(
    List<MoneyTransactionModel> transactions, dynamic action) {
  if (action is SupplyTransactionsPageLoadedAction) {
    return List.from(transactions)..addAll(action.transactionsPage);
  } else if (action is LoadSupplyTransactionsPageAction && action.pageNumber == 1) {
    return [];
  } else {
    return transactions;
  }
}

final Reducer<Exception> _errorReducer = combineReducers<Exception>([
  TypedReducer<Exception, ErrorOccurredAction>(_errorOccurredReducer),
  TypedReducer<Exception, ErrorHandledAction>(_errorHandledReducer),
]);

Exception _errorOccurredReducer(Exception _, ErrorOccurredAction action) {
  return action.exception;
}

Exception _errorHandledReducer(Exception _, ErrorHandledAction action) {
  return null;
}
