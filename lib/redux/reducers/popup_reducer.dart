

import 'package:inventory_controller/redux/actions/popup_action.dart';
import 'package:inventory_controller/redux/appState/popup_state.dart';


PopupState popupReducer(PopupState state, action) {
  return state.copyWith(
    underLine: _changeUnderLine(state.underLine, action),
  );
}

bool _changeUnderLine(bool underline, dynamic action) {
  if (action is UnderLineAction) {
    return  action.underLine;
  } else {
    return underline;
  }
}