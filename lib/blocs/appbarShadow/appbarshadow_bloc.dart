import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbarshadow_event.dart';
part 'appbarshadow_state.dart';

class AppbarshadowBloc extends Bloc<AppbarshadowEvent, AppbarshadowState> {
  AppbarshadowBloc() : super(AppbarshadowInitial());

  @override
  Stream<AppbarshadowState> mapEventToState(
    AppbarshadowEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
