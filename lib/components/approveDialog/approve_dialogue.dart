import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class ApproveDialogue extends StatefulWidget {
  
  final Widget child;
  ApproveDialogue({
    required this.child
  });
  @override
  State<StatefulWidget> createState() => ApproveDialogueState();
}

class ApproveDialogueState extends State<ApproveDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: controller.value * 3, sigmaY: controller.value * 3),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
