import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'package:inventory_controller/components/page_transition/page_transtion.dart';
import 'package:inventory_controller/containers/homePage/homePopup/popupAppbar_container.dart';
import 'package:inventory_controller/containers/homePage/home_container.dart';
import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
import 'package:inventory_controller/views/PopupMenuButtonPage/PopupMenuButtonPage.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:inventory_controller/views/all_products/all_products.dart';
import 'package:inventory_controller/views/notificationDrawer/notification_drawer.dart';
import '../views/dashboard/dashboard.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> 
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<MyHomePage> {
  AnimationController _controller;
  bool _isDialogShowing = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = AnimationController(
      value: 1.0,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {
          // setState needs to be called to trigger a rebuild because
          // the 'HIDE FAB'/'SHOW FAB' button needs to be updated based
          // the latest value of [_controller.status].
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
    assert(false);
    return null;
  }

  var loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawerEnableOpenDragGesture: false,
      // drawer: NotificationDrawer(),
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // InkWell(
            //   onTap: () {
                
            //   },
            //   // customBorder: BorderRadius.circular(50),
            //   child: Container(
            //     margin: EdgeInsets.only(left: 16, right: 16),
            //     child: SvgPicture.asset(
            //       "assets/svg/agaseke_logo.svg",
            //       color: Color(0xFF0bd50b),
            //       height: 45,
            //       width: 25,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Text(
                    'Invetory Controller',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Container(
              child: LeadingButton(
                color: lightShadeColor,
                icon: Icons.send,
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
                rotate: -20 * math.pi / 180,
                iconColor: darkColor,
                onPressed: () => {Navigator.push(
                    context,
                    PageTransition(
                        child: NotificationDrawer(),
                        childCurrent: MyHomePage(),
                        type: PageTransitionType.leftToRightJoined))},
                size: 37, // btnShadow: false
              ),
            ),
            Container(
              child: LeadingButton(
                color: lightShadeColor,
                icon: Icons.more_horiz_outlined,
                iconColor: darkColor,
                size: 37, // btnShadow: false
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        HomePageContainer(),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton(
            child: const Icon(Icons.view_day_sharp),
            backgroundColor: primaryColor,
            onPressed: () {
              // if (_isAnimationRunningForwardsOrComplete) {
              //   _controller.reverse();

              // } else {
              //   _controller.forward();

              // }

              showModal<void>(
                context: context,
                configuration: FadeScaleTransitionConfiguration(
                    barrierColor: Colors.black.withOpacity(.7)),
                builder: (BuildContext context) {
                  return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: _ExampleAlertDialog(loading: loading));
                },
              );
            },
          ),
        ),
      ]),
    );
  }
  @override
  bool get wantKeepAlive => true;
}

class _ExampleAlertDialog extends StatefulWidget {
  _ExampleAlertDialog({
    this.loading,
  });
  final bool loading;
  @override
  __ExampleAlertDialogState createState() => __ExampleAlertDialogState();
}

class __ExampleAlertDialogState extends State<_ExampleAlertDialog> {
  ScrollController _scrollController = ScrollController();

  var scrollPos = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Material(
            child: Column(
              children: [
                // HomePopupContainer(),
                PopupAppbarScreen(underLine: scrollPos),
                Expanded(
                  child:
                      // Container()
                      ListView.separated(
                    physics: BouncingScrollPhysics(
                        parent: const AlwaysScrollableScrollPhysics()), // new
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                    itemCount: 16,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemBuilder: (BuildContext ctxt, int index) {
                      return InkWell(
                        highlightColor: primaryColor.withOpacity(.4),
                        splashColor: primaryColor,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetail()));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 3),
                          // width: MediaQuery.of(context).size.width * 1,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.radio_button_unchecked,
                                color: primaryColor,
                                size: 7.0,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                "Travetine",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > 2 && scrollPos == false) {
      setState(() {
        scrollPos = true;
      });
    } else if (currentScroll < 2 && scrollPos == true) {
      setState(() {
        scrollPos = false;
      });
    }
  }
}
