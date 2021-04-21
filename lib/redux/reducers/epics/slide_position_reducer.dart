


import 'package:inventory_controller/redux/actions/epics/main_slide.dart';
import 'package:inventory_controller/redux/appState/epics/slide_position.dart';

MainSlideEpicPositionState  mainSlideEpicPositionReducer(MainSlideEpicPositionState state, action) {
  return state.copyWith(
      position: _changePosition(state.position, action));
}

double _changePosition(double state, dynamic action) {
  if (action is ChangeSlidePosition) {
    return  action.position;
  } else {
    return state;
  }
}