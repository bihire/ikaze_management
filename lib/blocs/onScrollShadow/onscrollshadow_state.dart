part of 'onscrollshadow_cubit.dart';

@immutable
class OnscrollshadowState extends Equatable {
  final bool isShadow;
  OnscrollshadowState({this.isShadow = false});

  OnscrollshadowState copyWith({isShadow}) {
    return OnscrollshadowState(isShadow: isShadow ?? this.isShadow);
  }

  @override
  List<Object> get props => [isShadow];
}
