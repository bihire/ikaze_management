
import 'package:inventory_controller/redux/actions/dashboard_daily_total.dart';
import 'package:inventory_controller/redux/appState/dashboard_daily_total_state.dart';

import 'package:redux/redux.dart';

DashoardDailyTotalState dailyDashboardTotalReducer(DashoardDailyTotalState state, action) {
  return state.copyWith(
    isDataLoading: _isDataLoadingReducer(state.isDataLoading, action),
    dailTotal: _dailyTotalReducer(state.dailTotal, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadDashboardDailyTotalAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, DashboardDailyTotalLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

String _dailyTotalReducer(String dailyTotal, dynamic action) {
  if (action is DashboardDailyTotalLoadedAction) {
    return (action.dashboardDailyTotal);
  } else {
    return dailyTotal;
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
