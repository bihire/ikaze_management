import 'package:flutter/material.dart';

class LeadingButton extends StatelessWidget {
  final IconData? icon;
  final Color? color, iconColor;
  final double? iconSize, size, padding, rotate;
  final VoidCallback? onPressed;
  final EdgeInsets margin;

  LeadingButton(
      {this.icon,
      this.color,
      required this.onPressed,
      this.size,
      this.iconSize,
      this.iconColor,
      this.rotate = 0,
      this.padding = 0,
      this.margin = const EdgeInsets.all(10)});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: margin,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          padding: EdgeInsets.all(padding != null ? padding! : 0),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: onPressed,
            child: Transform.rotate(
              angle: rotate!,
              child: Center(
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
            ),
          )),
    );
  }
}
