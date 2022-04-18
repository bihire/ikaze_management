import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({required this.milliseconds});

  final int milliseconds;
  late VoidCallback action;
  late Timer? _timer;

  run(VoidCallback action) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}