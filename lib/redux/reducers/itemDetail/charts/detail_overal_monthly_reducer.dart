
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_monthly_action.dart';
import 'package:inventory_controller/redux/appState/itemDetail/charts/detail_overal_monthly_state.dart';

import 'package:redux/redux.dart';

DetailOveralMonthlyState detailOveralMonthlyReducer(DetailOveralMonthlyState state, action) {
  return state.copyWith(
    loading: _isDataLoadingReducer(state.loading, action),
    overalMonthlyData: _overalMonthlyTransactionReducer(state.overalMonthlyData, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, DetailOveralMonthlyAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, DetailOveralMonthlyLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

List<OveralMonthlyTransactionModel> _overalMonthlyTransactionReducer(List<OveralMonthlyTransactionModel> overalMonthlyData, dynamic action) {
  if (action is DetailOveralMonthlyLoadedAction) {
    return  List.from(overalMonthlyData)..addAll(action.overalMonthly);
  } else {
    return overalMonthlyData;
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
