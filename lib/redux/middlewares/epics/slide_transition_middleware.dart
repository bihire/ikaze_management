
import 'package:inventory_controller/redux/actions/epics/main_slide.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'dart:async';
import 'package:redux_epics/redux_epics.dart';


Stream<dynamic> slidePositionMiddleware(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
    ) async* {
  await for (var action in actions) {
    if (action == ChangeSlidePosition) {
      yield (ChangeSlidePosition);
    }
  }
}