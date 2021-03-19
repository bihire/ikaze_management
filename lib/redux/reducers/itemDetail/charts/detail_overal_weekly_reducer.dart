
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_weekly_actions.dart';
import 'package:inventory_controller/redux/appState/itemDetail/charts/detail_overal_weekly_state.dart';

import 'package:redux/redux.dart';

DetailOveralWeeklyState detailOveralWeeklyReducer(DetailOveralWeeklyState state, action) {
  return state.copyWith(
    loading: _isDataLoadingReducer(state.loading, action),
    overalWeeklyData: _overalWeeklyTransactionReducer(state.overalWeeklyData, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, DetailOveralWeeklyAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, DetailOveralWeeklyLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

List<OveralWeeklyTransactionModel> _overalWeeklyTransactionReducer(List<OveralWeeklyTransactionModel> overalWeeklyData, dynamic action) {
  if (action is DetailOveralWeeklyLoadedAction) {
    return  List.from(overalWeeklyData)..addAll(action.overalWeekly);
  } else {
    return overalWeeklyData;
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
