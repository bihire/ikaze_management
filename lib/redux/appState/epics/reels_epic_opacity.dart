
import 'package:meta/meta.dart';

@immutable
class ReelsEpicOpacityState {
  ReelsEpicOpacityState({
    @required this.opacity,
  });
  final double opacity;

  factory ReelsEpicOpacityState.initial() => ReelsEpicOpacityState(
    opacity: 0.0
  );

  ReelsEpicOpacityState copyWith({
    opacity
  }) {
    return ReelsEpicOpacityState(
      opacity: opacity ?? this.opacity,
    );
  }

  @override
  String toString() {
    return "PopupState: isDataLoading = $opacity";
  }
}