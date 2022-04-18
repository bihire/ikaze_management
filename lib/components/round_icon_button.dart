
import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size, transform, shadow, iconSize;
  final VoidCallback onPressed;
  RoundIconButton.large({
    required this.icon,
    this.color,
    required this.onPressed,
    this.iconSize,
    this.transform,
    this.shadow = 10.0
}): size = 60.0;

  RoundIconButton.small({
    required this.icon,
    this.color,
    this.iconSize,
    this.transform,
    required this.onPressed,
    this.shadow = 10.0
  }): size = 50.0;

  RoundIconButton({
    required this.icon,
    this.color,
    required this.onPressed,
    this.transform,
    this.size,
    this.iconSize,
    this.shadow = 10.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x11000000),
            blurRadius: shadow!,
          )
        ]
      ),
      child: InkWell(
          borderRadius: BorderRadius.circular(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.rotate(
      angle: transform == null ? 0 : transform!,
        child: Icon(
        icon,
        size: iconSize,
        color: color,
      ),
            ),
          ),
            onTap: onPressed

        ),
    );
  }
}