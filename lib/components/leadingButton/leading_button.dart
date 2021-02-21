import 'package:flutter/material.dart';

class LeadingButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final double size;
  final VoidCallback onPressed;
  final double padding;
  final EdgeInsets margin;
  final double rotate;

  LeadingButton(
      {this.icon,
      this.color,
      this.onPressed,
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
          padding: EdgeInsets.all(padding),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: onPressed,
            child: Transform.rotate(
              angle: rotate,
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
