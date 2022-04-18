/// Transition enum
enum PageRoutingType {
  /// Fade Animation
  fade,

  /// Right to left with opacity animation
  rightToLeftWithOpacity,

  /// Right to left with opacity animation
  leftToRightWithOpacity,

  /// Right to left animation
  rightToLeft,

  /// Left to right animation
  leftToRight,

  /// Left to right animation leave
  leftToRightLeave,

  /// Top the bottom animation
  topToBottom,

  /// bottom the top animation
  bottomToTop,

  /// scale animation
  scale,

  /// Rotate animation
  rotate,

  /// Size animation
  size,

  /// Right to left with fading animation
  rightToLeftWithFade,

  /// Left to right with fading animation
  leftToRightWithFade,

  /// Left to right slide as if joined
  leftToRightJoined,

  /// Right to left slide as if joined
  rightToLeftJoined,
}