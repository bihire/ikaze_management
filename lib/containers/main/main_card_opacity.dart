import 'package:flutter/material.dart';

class MainCardOpacity extends StatelessWidget {
  final double opacity;
  MainCardOpacity({required this.opacity});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AbsorbPointer(
      absorbing: opacity > 0.0 ? true : false,
      child: Container(
          // key: Key('$index'),
          width: width,
          color: Color(0xFF000000).withOpacity(opacity)),
    );
  }
}
