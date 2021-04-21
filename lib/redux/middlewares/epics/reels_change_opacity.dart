

import 'dart:async';
import 'package:inventory_controller/redux/actions/epics/main_slide.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:redux_epics/redux_epics.dart';


Stream<dynamic> slideOpacityMiddleware(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
    ) async* {
  // Use the `await for` keyword to listen to the stream inside an async*
  // function!
  await for (var action in actions) {
    // Then check to see if we've received an increment action
    if (action == ChangeSlideOpacity) {
      // If so, emit a decrement action to the Stream using the `yield` keyword!
      // This decrement action will be automatically dispatched.
      yield (ChangeSlideOpacity);
    }
  }
}