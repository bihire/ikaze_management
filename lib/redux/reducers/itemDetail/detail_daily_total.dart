

import 'package:inventory_controller/redux/actions/itemDetail/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/appState/itemDetail/daily_detail_sum.dart';

import 'package:redux/redux.dart';

DetailDailySalesTotalState detailDailySalesTotalReducer(DetailDailySalesTotalState state, action) {
  return state.copyWith(
    loading: _isDataLoadingReducer(state.loading, action),
    dailyTotal: _dailyTotalReducer(state.dailyTotal, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, DetailDailySumAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, DetailDailySumLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorDetailDailyOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

String _dailyTotalReducer(String dailyTotal, dynamic action) {
  if (action is DetailDailySumLoadedAction) {
    return (action.detailDailyTotal);
  } else {
    return dailyTotal;
  }
}

final Reducer<Exception> _errorReducer = combineReducers<Exception>([
  TypedReducer<Exception, ErrorDetailDailyOccurredAction>(_errorOccurredReducer),
  TypedReducer<Exception, ErrorHandledAction>(_errorHandledReducer),
]);

Exception _errorOccurredReducer(Exception _, ErrorDetailDailyOccurredAction action) {
  return action.exception;
}

Exception _errorHandledReducer(Exception _, ErrorHandledAction action) {
  return null;
}
