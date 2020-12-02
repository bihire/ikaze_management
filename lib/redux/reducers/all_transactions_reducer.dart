// import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/redux/actions/all_transactions_actions.dart';
import 'package:inventory_controller/redux/appState/all_transactions_state.dart';

// allTransactionReducer(
//     TransactionState prevState, SetTransactionStateAction action) {
//   final payload = action.transactionState;
//   // final currentState = [...prevState.transactions, ...payload.transactions];
//   // print([...prevState.transactions]);
//   // print(payload.transactions);
//   return prevState.copyWith(
//     isError: payload.isError,
//     isLoading: payload.isLoading,
//     transactions: payload.transactions == null ? payload.transactions : [...prevState.transactions, ...payload.transactions],
//   );
// }

// import 'actions.dart';
// import 'package:flutter_redux_infinite_list/models/github_issue.dart';
// import 'package:flutter_redux_infinite_list/redux/state.dart';
import 'package:redux/redux.dart';

TransactionState allTransactionsReducer(TransactionState state, action) {
  return state.copyWith(
    isDataLoading: _isDataLoadingReducer(state.isDataLoading, action),
    isNextPageAvailable:
        _isNextPageAvailableReducer(state.isNextPageAvailable, action),
    transactions: _transactionsReducer(state.transactions, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadTransactionsPageAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, TransactionsPageLoadedAction>(
      _isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

bool _isNextPageAvailableReducer(bool isNextPageAvailable, dynamic action) {

  return (action is TransactionsPageLoadedAction)
      ? action.transactionsPage.length == TransactionState.transactionsPerPage
      : isNextPageAvailable;
}

List<MoneyTransactionModel> _transactionsReducer(
    List<MoneyTransactionModel> transactions, dynamic action) {
  if (action is TransactionsPageLoadedAction) {
    return List.from(transactions)..addAll(action.transactionsPage);
  } else if (action is LoadTransactionsPageAction && action.pageNumber == 1) {
    return List<MoneyTransactionModel>();
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
