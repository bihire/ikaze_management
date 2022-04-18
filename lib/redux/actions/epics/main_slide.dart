import 'package:meta/meta.dart';

class ChangeSlidePosition {
  ChangeSlidePosition({
    required this.position,
  });

  final double position;
}

class ChangeSlideOpacity {
  ChangeSlideOpacity({
    required this.opacity,
  });

  final double opacity;
}



class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
