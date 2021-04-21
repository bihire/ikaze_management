//
import 'package:flutter/material.dart';
import 'dart:math';
// class CustomPageScrollPhysics extends ScrollPhysics {
//   @override
//   ScrollPhysics applyTo(ScrollPhysics ancestor) {
//     return PageScrollPhysics(parent: BouncingScrollPhysics());
//   }
//
//   @override
//   Simulation createBallisticSimulation(
//       ScrollMetrics position, double velocity) {
//     return CustomSimulation(
//       initPosition: position.pixels,
//       velocity: velocity * 3,
//     );
//   }
// }
//
// class CustomSimulation extends Simulation {
//   final double initPosition;
//   final double velocity;
//
//   CustomSimulation({this.initPosition, this.velocity});
//
//   @override
//   double x(double time) {
//     var c =
//       max(min(initPosition, 0.0), initPosition + velocity * time * 3);
//     return c;
//   }
//
//   @override
//   double dx(double time) {
//     print(initPosition);
//     return velocity;
//   }
//
//   @override
//   bool isDone(double time) {
//     return false;
//   }
// }



// class PageScrollPhysics extends ScrollPhysics {
//   /// Creates physics for a [PageView].
//   const PageScrollPhysics({ ScrollPhysics parent }) : super(parent: parent);
//
//   @override
//   PageScrollPhysics applyTo(ScrollPhysics ancestor) {
//     return PageScrollPhysics(parent: buildParent(ancestor));
//   }
//
//   double _getPage(ScrollPosition position) {
//     if (position is _PagePosition)
//       return position.page;
//     return position.pixels / position.viewportDimension;
//   }
//
//   double _getPixels(ScrollPosition position, double page) {
//     if (position is _PagePosition)
//       return position.getPixelsFromPage(page);
//     return page * position.viewportDimension;
//   }
//
//   double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
//     double page = _getPage(position);
//     if (velocity < -tolerance.velocity)
//       page -= 0.5;
//     else if (velocity > tolerance.velocity)
//       page += 0.5;
//     return _getPixels(position, page.roundToDouble());
//   }
//
//   @override
//   Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
//     // If we're out of range and not headed back in range, defer to the parent
//     // ballistics, which should put us back in range at a page boundary.
//     if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
//         (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
//       return super.createBallisticSimulation(position, velocity);
//     final Tolerance tolerance = this.tolerance;
//     final double target = _getTargetPixels(position, tolerance, velocity);
//     if (target != position.pixels)
//       return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
//     return null;
//   }
//
//   @override
//   bool get allowImplicitScrolling => false;
// }






class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  CustomScrollPhysics({this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / itemDimension;
  }

  double _getPixels(double page) {
    return page * itemDimension;
  }

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
