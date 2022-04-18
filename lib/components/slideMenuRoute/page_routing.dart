library page_routing;
import 'enum.dart';

import 'package:flutter/material.dart';

class FromMenuRoute extends PageRouteBuilder {
  final Widget? nextPage;
  final Widget? prevPage;

  FromMenuRoute({this.prevPage, this.nextPage})
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: secondaryAnimation,
                    builder: (context, innerChild) {
                      return Transform.scale(
                          scale: (animation.value - secondaryAnimation.value),
                          child: nextPage);
                    },
                  );
                },
              );
            },
            maintainState: true,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: secondaryAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          1.0 - animation.value,
                          0.0,
                        ),
                        child: Material(elevation: 1, child: nextPage),
                      );
                    },
                  );
                },
              );
            });
}

class PageRoute extends PageRouteBuilder {
  final Widget? pageWidget;
  final Function? customAnimation;

  PageRoute({this.pageWidget, this.customAnimation})
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return pageWidget!;
            },
            maintainState: true,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return customAnimation!(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation);
            });
}

/// This package allows you amazing transition for your routes
/// Page transition class extends PageRouteBuilder
class PageRouting<T> extends PageRouteBuilder<dynamic> {
  /// Child for your next page
  final Widget child;

  /// Child for your next page
  final Widget? childCurrent;

  /// Transition types
  ///  fade,rightToLeft,leftToRight, upToDown,downToUp,scale,rotate,size,rightToLeftWithFade,leftToRightWithFade
  final PageRoutingType type;

  /// Curves for transitions
  final Curve curve;

  /// Aligment for transitions
  final Alignment? alignment;

  /// Durationf for your transition default is 300 ms
  final Duration duration;

  /// Duration for your pop transition default is 300 ms
  final Duration reverseDuration;

  /// Context for inheret theme
  final BuildContext? ctx;

  /// Optional inheret teheme
  final bool inheritTheme;

  /// Page transition constructor. We can pass the next page as a child,
  PageRouting({
    Key? key,
    required this.child,
    required this.type,
    this.childCurrent,
    this.ctx,
    this.inheritTheme = false,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 500),
    RouteSettings? settings,
  })  : assert(inheritTheme ? ctx != null : true,
            "'ctx' cannot be null when 'inheritTheme' is true, set ctx: context"),
        super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return inheritTheme
                ? InheritedTheme.captureAll(
                    ctx!,
                    child,
                  )
                : child;
          },
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          settings: settings,
          maintainState: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (type) {
              case PageRoutingType.fade:
                return FadeTransition(opacity: animation, child: child);

              /// PageRoutingType.rightToLeft which is the give us right to left transition
              case PageRoutingType.rightToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );

                /// PageRoutingType.rightToLeft which is the give us right to left transition
              case PageRoutingType.rightToLeftWithOpacity:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: Stack(
                    children: [
                      child,
                      IgnorePointer(
                        ignoring: true,
                        child: Container(
          
          color: Color(0xFF000000).withOpacity((1 - animation.value))))
                    ],
                  ),
                );
                break;

              /// PageRoutingType.leftToRight which is the give us left to right transition
              case PageRoutingType.leftToRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                break;

              /// PageRoutingType.leftToRightWithOpacity which is the give us left to right transition
              case PageRoutingType.leftToRightWithOpacity:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                break;
              
              /// PageRoutingType.leftToRight which is the give us left to right transition Leave
              case PageRoutingType.leftToRightLeave:
                final Tween<Offset> offsetTween = Tween<Offset>(
                        begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0));
                    final Animation<Offset> slideOutLeftAnimation =
                        offsetTween.animate(secondaryAnimation);
                    return SlideTransition(
                        position: slideOutLeftAnimation, child: child);
                break;

              /// PageRoutingType.topToBottom which is the give us up to down transition
              case PageRoutingType.topToBottom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                break;

              /// PageRoutingType.downToUp which is the give us down to up transition
              case PageRoutingType.bottomToTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                break;

              /// PageRoutingType.scale which is the scale functionality for transition you can also use curve for this transition
              case PageRoutingType.scale:
                return ScaleTransition(
                  alignment: alignment!,
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Interval(
                      0.00,
                      0.50,
                      curve: curve,
                    ),
                  ),
                  child: child,
                );
                break;

              /// PageRoutingType.rotate which is the rotate functionality for transition you can also use alignment for this transition
              case PageRoutingType.rotate:
                return RotationTransition(
                  alignment: alignment!,
                  turns: animation,
                  child: ScaleTransition(
                    alignment: alignment,
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
                break;

              /// PageRoutingType.size which is the rotate functionality for transition you can also use curve for this transition
              case PageRoutingType.size:
                return Align(
                  alignment: alignment!,
                  child: SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                    child: child,
                  ),
                );
                break;

              /// PageRoutingType.rightToLeftWithFade which is the fade functionality from right o left
              case PageRoutingType.rightToLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
                break;

              /// PageRoutingType.leftToRightWithFade which is the fade functionality from left o right with curve
              case PageRoutingType.leftToRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
                break;

              case PageRoutingType.rightToLeftJoined:
                assert(childCurrent != null, """
                When using type "rightToLeftJoined" you need argument: 'childCurrent'
                example:
                  child: MyPage(),
                  childCurrent: this
                """);
                return Stack(
                  children: <Widget>[
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(-1.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: childCurrent,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    )
                  ],
                );
                break;

              case PageRoutingType.leftToRightJoined:
                assert(childCurrent != null, """
                When using type "leftToRightJoined" you need argument: 'childCurrent'
                example:
                  child: MyPage(),
                  childCurrent: this
                """);
                return Stack(
                  children: <Widget>[
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: child,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(1.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        ),
                      ),
                      child: childCurrent,
                    )
                  ],
                );
                break;

              /// FadeTransitions which is the fade transition
              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
        );
}