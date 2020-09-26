
import 'package:inventory_controller/models/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/overal_daily_action.dart';
import 'package:inventory_controller/redux/appState/overal_daily_state.dart';

import 'package:redux/redux.dart';

OvaraldailyState overalDailyTransactionsReducer(OvaraldailyState state, action) {
  return state.copyWith(
    isDataLoading: _isDataLoadingReducer(state.isDataLoading, action),
    overalDailydata: _overalDailyTransactionReducer(state.overalDailydata, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadOvaralDailyAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, OvaralDailyLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

List<OveralDailyTransactionModel> _overalDailyTransactionReducer(List<OveralDailyTransactionModel> overalDailydata, dynamic action) {
  if (action is OvaralDailyLoadedAction) {
    return  List.from(overalDailydata)..addAll(action.overalDaily);
  } else {
    return overalDailydata;
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
