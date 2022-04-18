import 'dart:ui';

import 'package:flutter/material.dart';

Future<T?> showNewDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required Widget? child,
  WidgetBuilder? builder,
}) {
  assert(child == null || builder == null);
  assert(debugCheckHasMaterialLocalizations(context));

  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = child ?? Builder(builder: builder!);
      return Builder(builder: (BuildContext context) {
        return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
      });
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 250),
    transitionBuilder: _buildNewTransition,
  );
}

Widget _buildNewTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedValue = Curves.decelerate.transform(animation.value) - 1.0;
  return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: animation.value * 3, sigmaY: animation.value * 3),
      child: Center(
    child: Material(
      color: Colors.transparent,
      child: Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * -400, 0.0),
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      ),
    ),)
  );
  
}
