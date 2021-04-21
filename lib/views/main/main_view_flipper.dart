import 'dart:ui';
import 'dart:math';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/components/customScrollPhysics/custom_scroll_physics.dart';
import 'package:inventory_controller/redux/actions/epics/main_slide.dart';
import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/main/main_pages.dart';
// import 'package:ikaze_shop_mobile/common/shopping_cart.dart';
// import 'package:ikaze_shop_mobile/containers/card_opacity_container.dart';
// import 'package:ikaze_shop_mobile/containers/main/main_page_transition.dart';
// import 'package:ikaze_shop_mobile/containers/main/slide_position.dart';
// import 'package:ikaze_shop_mobile/redux/actions/main.dart';
// import 'package:ikaze_shop_mobile/redux/actions/reels_epic.dart';
// import 'package:ikaze_shop_mobile/redux/appState/app_state.dart';
// import 'package:ikaze_shop_mobile/views/explore/explore.dart';
// import 'package:ikaze_shop_mobile/views/homePage/components/bottomNavigationBar/bottom_navigation_bar.dart';
// import 'package:ikaze_shop_mobile/views/homePage/home_page.dart';
// import 'package:ikaze_shop_mobile/views/main/main_pages.dart';
// import 'package:ikaze_shop_mobile/views/reels/components/page_scroll_physics.dart';
// import 'package:ikaze_shop_mobile/views/reels/components/profile.dart';
// import 'package:ikaze_shop_mobile/views/shoppinCart/shopping_cart.dart';

import 'package:redux/redux.dart';

class MainViewFlipper extends StatefulWidget {
  final Store<AppState> store;
  final Widget child;

  MainViewFlipper({this.store, this.child});
  @override
  State<StatefulWidget> createState() => MainViewFlipperState();
}

class MainViewFlipperState extends State<MainViewFlipper>
    with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragScrollPercent;
  double finishScrollStart;
  double finishScrollEnd;
  int currentTitle = 0;
  double prevIndex;
  int currIndex;
  double dimension;
  double halfDimension;
  double newOpacity = 0.00;
  int pages;
  AnimationController finishScrollAnimation;

  ScrollPhysics _physics;
  final _controller = PageController();
  StreamController<double> _cardOpacityController = StreamController<double>();
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        pages = 2;
        dimension = _controller.position.maxScrollExtent / (pages - 1);
        halfDimension = dimension / 2;

        setState(() {
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
      int currIndexState =
          (_controller.position.pixels / dimension).floor() + 1;

      if (currIndex != currIndexState) {
        setState(() {
          currIndex = currIndexState;
        });
      }

      double op = _controller.position.pixels % dimension;

      newOpacity = _dp((1 - 0) / (dimension - 0) * (op - dimension) + 1, 2);
      widget.store.dispatch(ChangeSlideOpacity(opacity: (1-newOpacity) / 3));
      if (_controller.position.pixels <= dimension) {
        widget.store.dispatch(ChangeSlidePosition(
            position: dimension - _controller.position.pixels));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void closeStream() {
    _cardOpacityController.close();
  }

  double _dp(double val, int places) {
    double mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: MainPages(controller: _controller, currentIndex: currIndex));
  }
}
