import 'package:flutter/material.dart';

class MainSlidePosition extends StatelessWidget {
  final double position;
  final Widget child;
  MainSlidePosition({this.position, this.child});
  @override
  Widget build(BuildContext context) {

    return Transform.translate(
                  offset: Offset( - position / 2, 0.0),
                  child: child,
                );
  }
}
