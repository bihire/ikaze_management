import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  const TextFieldContainer({
    Key key,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 2),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
