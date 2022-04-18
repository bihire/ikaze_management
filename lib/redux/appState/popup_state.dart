import 'package:meta/meta.dart';

@immutable
class PopupState {
  PopupState({
    required this.underLine,
  });

  final bool underLine;

  factory PopupState.initial() => PopupState(
        underLine: false,
      );

  PopupState copyWith({
    underLine,
  }) {
    return PopupState(
      underLine: underLine ?? this.underLine,
    );
  }

  @override
  String toString() {
    return "PopupState: isDataLoading = $underLine";
  }
}
