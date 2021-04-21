
import 'package:meta/meta.dart';

@immutable
class MainSlideEpicPositionState {
  MainSlideEpicPositionState({
    @required this.position,
  });
  final double position;

  factory MainSlideEpicPositionState.initial() => MainSlideEpicPositionState(
    position: 0.0
  );

  MainSlideEpicPositionState copyWith({
    position
  }) {
    return MainSlideEpicPositionState(
      position: position ?? this.position,
    );
  }

  @override
  String toString() {
    return "PopupState: isDataLoading = $position";
  }
}