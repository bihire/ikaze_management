
import 'package:inventory_controller/models/auth.dart/user.dart';
import 'package:inventory_controller/redux/actions/auth/login.dart';
import 'package:inventory_controller/redux/appState/auth/auth_state.dart';
import 'package:redux/redux.dart';

AuthState authenticationReducer(AuthState state, action) {
  return state.copyWith(
    loading: _loadingReducer(state.loading, action),
    user: _userReducer(state.user, action),
    error: _errorReducer(state.error, action),
  );
}

final Reducer<bool> _loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadingLoginAction>(_loadingStartedReducer),
  TypedReducer<bool, UserLoginSuccess>(_loadingFinishedReducer),
  TypedReducer<bool, ErrorOccurredAction>(_loadingFinishedReducer),
]);

bool _loadingStartedReducer(bool _, dynamic action) {
  return true;
}

bool _loadingFinishedReducer(bool _, dynamic action) {
  return false;
}

User _userReducer(user, dynamic action) {
  if (action is UserLoginSuccess) {
    return action.user;
  } else {
    return user;
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
