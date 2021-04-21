import 'package:flutter/material.dart';
import 'package:inventory_controller/containers/homePage/homeList/home_list_container.dart';
import 'package:inventory_controller/containers/main/main_page_transition.dart';
import 'package:inventory_controller/containers/main/slide_position.dart';
import 'package:inventory_controller/pages/home.dart';
import 'package:inventory_controller/views/onboarding/onboarding.dart';
// import 'package:ikaze_shop_mobile/common/shopping_cart.dart';
// import 'package:ikaze_shop_mobile/containers/main/main_page_transition.dart';
// import 'package:ikaze_shop_mobile/containers/main/slide_position.dart';
// import 'package:ikaze_shop_mobile/main.dart';
// import 'package:ikaze_shop_mobile/views/shoppinCart/shopping_cart.dart';
// 
class Navi {
  final Widget widget;
  final GlobalKey<NavigatorState> naviKey;
  Navi({this.widget, this.naviKey});
}

class MainPages extends StatefulWidget {
  int currentIndex;
  PageController controller;
  MainPages({@required this.controller, @required this.currentIndex});
  @override
  MainPagesState createState() => MainPagesState();
}

class MainPagesState extends State<MainPages> {
  int _currentPage = 0;
  int _currentPageIndex = 0;

  List<Navi> _items = [
    Navi(widget: OnboardingScreen(), naviKey: GlobalKey<NavigatorState>()),
    Navi(widget: SlidePositionContainer(child: MyHomePage()), naviKey: GlobalKey<NavigatorState>())
  ];

  Widget _navigationTab({GlobalKey<NavigatorState> naviKey, Widget widget}) {
    return Navigator(
      key: naviKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }

  void _selectTab(int index) {
    if (index == _currentPageIndex) {
      _items[index].naviKey.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _items[_currentPageIndex].naviKey.currentState.maybePop();

          if (isFirstRouteInCurrentTab) {
            if (_currentPageIndex != 0) {
              widget.controller.animateToPage(_currentPageIndex - 1,
                  duration: Duration(milliseconds: 200), curve: Curves.easeOut);
              return false;
            }
          }
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: PageView(
          onPageChanged: (index) => {_selectTab(index)},
          controller: widget.controller,
          children: [
            _navigationTab(
                    naviKey: _items[0].naviKey, widget: _items[0].widget),
            // Stack(
            //   children: [
                
            //     // SlidePositionContainer(child: ThisApp()),
            //     IgnorePointer(
            //       ignoring: true,
            //       child: widget.currentIndex == 0
            //           ? MainCardTransitionContainer()
            //           : Container(),
            //     ),
            //   ],
            // ),
            
            ClipRRect(
                          child: Stack(children: [
                _navigationTab(
                    naviKey: _items[1].naviKey, widget: _items[1].widget),
                IgnorePointer(
                  ignoring: true,
                  child: widget.currentIndex == 1
                      ? MainCardTransitionContainer()
                      : Container(),
                ),
              ]),
            ),
            // _navigationTab(
            //     naviKey: _items[2].naviKey, widget: _items[2].widget),
          ],
        ),
      ),
    );
  }
}
