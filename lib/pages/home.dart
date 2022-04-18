import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/onScrollShadow/onscrollshadow_cubit.dart';
import 'package:inventory_controller/common/constants.dart';
// import 'package:inventory_controller/components/customDropDown/custom_drop_down.dart';
// import 'package:inventory_controller/components/customDropDown/show_dropdown.dart';
// import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'package:inventory_controller/components/page_transition/page_transtion.dart';
// import 'package:inventory_controller/containers/homePage/homePopup/popupAppbar_container.dart';
import 'package:inventory_controller/containers/homePage/home_container.dart';
import 'package:inventory_controller/containers/productList/product_list_container.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
// import 'package:inventory_controller/views/homePage/floatingButton/floating_dialogue.dart';
// import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
// import 'package:inventory_controller/views/PopupMenuButtonPage/PopupMenuButtonPage.dart';
// import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
// import 'package:inventory_controller/views/all_products/all_products.dart';
import 'package:inventory_controller/views/homePage/home_menu_page.dart';
import 'package:inventory_controller/views/newTransaction/new_transaction.dart';
// import 'package:inventory_controller/views/notificationDrawer/notification_drawer.dart';
import 'package:inventory_controller/views/productListModal/product_list_modal.dart';
import 'package:inventory_controller/views/settingDrawer/settings_drawer.dart';
// import '../views/dashboard/dashboard.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:inventory_controller/utils/extensions.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  String shopName = '';
  bool _isDialogShowing = false;
  bool isCollapsed = true;
  late OnscrollshadowCubit onscrollshadowCubit;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    setShopName();
    onscrollshadowCubit = OnscrollshadowCubit();
    _controller = AnimationController(
      value: 1.0,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 75),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {});
      });
    _scrollController = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  setShopName() async {
    final shop = await getJson('active_shop');
    setState(() {
      shopName = shop['shop_name'];
    });
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
  }

  var loading = true;

  void changeIsCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.extentBefore == 0.0 &&
        onscrollshadowCubit.state.isShadow == true) {
      print('remove');
      onscrollshadowCubit.removeShadow();
    } else if (_scrollController.position.extentBefore != 0.0 &&
        onscrollshadowCubit.state.isShadow == false) {
      print('add');
      onscrollshadowCubit.addShadow();
    }
  }

  Future<bool> _onWillPop() {
    if (isCollapsed == false) {
      setState(() {
        isCollapsed = true;
      });
      // Navigator.of(context).pop(false);
      return Future.value(false);
    } else {
      Navigator.of(context).pop(true);
      return Future.value(true);
    }

    // return ;
  }

  Widget _buildPage() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        // endDrawerEnableOpenDragGesture: false,
        // endDrawer: SettingsDrawer(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0), // here the desired height
            child: BlocBuilder<OnscrollshadowCubit, OnscrollshadowState>(
                bloc: onscrollshadowCubit,
                builder: (context, state) {
                  return AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    titleSpacing: 0,
                    elevation: state.isShadow == true ? 4.0 : 0,
                    shadowColor: lightGreyColor,
                    automaticallyImplyLeading: false,
                    actions: [
                      Builder(
                        builder: (context) => AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: isCollapsed
                              ? Container(
                                  child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCollapsed = !isCollapsed;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lightShadeColor,
                                    ),
                                    child: Icon(Icons.person),
                                  ),
                                ))
                              : Container(),
                        ),
                      ),
                    ],
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: Text(
                                '$shopName shop'.toTitleCase(),
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  );
                })),
        body: Stack(children: [
          HomePageContainer(scrollController: _scrollController),
          Positioned(
            bottom: 100,
            right: 40,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          curve: Curves.easeIn,
                          reverseDuration: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 200),
                          child: NewTransactionPage(),
                          type: PageTransitionType.rightToLeft));
                },
                customBorder: CircleBorder(),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: const Icon(
                    Icons.add,
                    color: primaryLightColor,
                  ),
                )),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              child: const Icon(
                Icons.view_headline_sharp,
                color: darkColor,
              ),
              backgroundColor: primaryLightColor,
              onPressed: () {
                tripShowModalBottomSheet(
                    context,
                    ProductListContainer(
                      selectable: false,
                    ));
              },
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MenuDashboardPage(
      page: _buildPage(),
      menu: SettingsDrawer(
          isCollapsed: isCollapsed, changeIsCollapsed: changeIsCollapsed),
      isCollapsed: isCollapsed,
    );
  }

  // @override
  // bool get wantKeepAlive => false;
}
