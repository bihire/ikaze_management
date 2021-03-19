
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';
import 'package:inventory_controller/redux/actions/itemDetail/charts/overal_daily_action.dart';
import 'package:inventory_controller/redux/appState/itemDetail/charts/detail_overal_daily_state.dart';

import 'package:redux/redux.dart';

DetailOvaraldailyState detailOveralDailyReducer(DetailOvaraldailyState state, action) {
  return state.copyWith(
    isDataLoading: _isDataLoadingReducer(state.isDataLoading, action),
    overalDailydata: _overalDailyDataReducer(state.overalDailydata, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _isDataLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, DetailOvaralDailyAction>(_isDataLoadingStartedReducer),
  TypedReducer<bool, DetailOvaralDailyLoadedAction>(_isDataLoadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_isDataLoadingFinishedReducer),
]);

bool _isDataLoadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _isDataLoadingFinishedReducer(bool _, dynamic action) {
  return false;
}

List<OveralDailyTransactionModel> _overalDailyDataReducer(List<OveralDailyTransactionModel> overalDailydata, dynamic action) {
  if (action is DetailOvaralDailyLoadedAction) {
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
