
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/redux/middlewares/epics/reels_change_opacity.dart';
import 'package:inventory_controller/redux/middlewares/epics/slide_transition_middleware.dart';
import 'package:redux_epics/redux_epics.dart';

final epicMiddleWares = combineEpics<AppState>([
  slideOpacityMiddleware,
  slidePositionMiddleware,
]);