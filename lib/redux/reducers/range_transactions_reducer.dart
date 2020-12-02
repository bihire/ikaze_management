import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:inventory_controller/redux/actions/range_actions.dart';
import 'package:inventory_controller/redux/appState/range_state.dart';
import 'package:redux/redux.dart';

TransactionRangeState allTransactionsRangeReducer(
    TransactionRangeState state, action) {
  return state.copyWith(
    isRangeDataLoading: _isDataLoadingReducer(state.isRangeDataLoading, action),
    isNextRangePageAvailable:
        _isNextPageAvailableReducer(state.isNextRangePageAvailable, action),
    rangeTransactions: _transactionsReducer(state.rangeTransactions, action),
    rangeCount: _rangeCountReducer(state.rangeCount, action),
    rangeDate: _setDateReducer(state.rangeDate, action),
    rangeError: _errorReducer(state.rangeError, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadTransactionsRangePageAction>(
      _isDataLoadingStartedReducer),
  TypedReducer<bool, TransactionsRangePageLoadedAction>(
      _isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorRangeOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

Map _setDateReducer(Map rangeDate, dynamic action) {
  if (action is SetDateRangePageLoadedAction) {
    return {
      "rangeFromDate": action.fromDate,
      "rangeToDate": action.toDate,
    };
  } else {
    return rangeDate;
  }
}

bool _isNextPageAvailableReducer(bool isNextPageAvailable, dynamic action) {
  return (action is TransactionsRangePageLoadedAction)
      ? action.transactionsPage.length ==
          TransactionRangeState.transactionsPerPage
      : isNextPageAvailable;
}

List<MoneyTransactionModel> _transactionsReducer(
    List<MoneyTransactionModel> transactions, dynamic action) {
  if (action is TransactionsRangePageLoadedAction) {
    return List.from(transactions)..addAll(action.transactionsPage);
  } else if (action is LoadTransactionsRangePageAction &&
      action.pageNumber == 1) {
    return List<MoneyTransactionModel>();
  } else {
    return transactions;
  }
}

RangeCountModel _rangeCountReducer(RangeCountModel rangeCount, dynamic action) {
  if (action is TransactionsRangeCountLoadedAction) {
    return action.rangeCount;
  } else if (action is LoadTransactionsRangePageAction &&
      action.pageNumber == 1) {
    return RangeCountModel.fromJson(
        {"totalCount": null, "newTotal": null, "soldTotal": null});
  } else {
    return rangeCount;
  }
}

final Reducer<Exception> _errorReducer = combineReducers<Exception>([
  TypedReducer<Exception, ErrorRangeOccurredAction>(_errorOccurredReducer),
  TypedReducer<Exception, ErrorRangeHandledAction>(_errorHandledReducer),
]);

Exception _errorOccurredReducer(Exception _, ErrorRangeOccurredAction action) {
  return action.exception;
}

Exception _errorHandledReducer(Exception _, ErrorRangeHandledAction action) {
  return null;
}
