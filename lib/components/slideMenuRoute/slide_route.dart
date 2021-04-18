import 'package:flutter/material.dart';

class FromMenuRoute extends PageRouteBuilder {

  final Widget nextPage;
  final Widget prevPage;

  FromMenuRoute({this.prevPage, this.nextPage}) : super(
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return nextPage;
    },
    maintainState: true,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return Material(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-0.3, 0.0),
              ).animate(animation),
              child: prevPage,
            ),

            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: AnimatedBuilder(
                animation: animation,
                builder: (c, w) {
                  return Material(
                    shadowColor: Colors.black,
                    // elevation: 10.0 * animation.value,
                    child: nextPage
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  );
}