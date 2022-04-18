
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'onscrollshadow_state.dart';

class OnscrollshadowCubit extends Cubit<OnscrollshadowState> {
  OnscrollshadowCubit() : super(OnscrollshadowState());

  void addShadow() => emit(state.copyWith(isShadow: true));
  void removeShadow() => emit(state.copyWith(isShadow: false));
}
