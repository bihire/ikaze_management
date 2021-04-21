


import 'package:inventory_controller/redux/actions/epics/main_slide.dart';
import 'package:inventory_controller/redux/appState/epics/reels_epic_opacity.dart';

ReelsEpicOpacityState  reelsEpicOpacityReducer(ReelsEpicOpacityState state, action) {
  return state.copyWith(
      opacity: _changeUnderLine(state.opacity, action));
}

double _changeUnderLine(double state, dynamic action) {
  if (action is ChangeSlideOpacity) {
    return  action.opacity;
  } else {
    return state;
  }
}