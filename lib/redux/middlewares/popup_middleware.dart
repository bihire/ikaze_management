

import 'package:inventory_controller/redux/actions/popup_action.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> popupMiddleware() {
  return TypedMiddleware<AppState, UnderLineAction>(_changeUnderline());
}

_changeUnderline() {
  return (Store<AppState> store, UnderLineAction action,
      NextDispatcher next) {
    next(action);
    store.dispatch(UnderLineAction(underLine: action.underLine));
  };
}
