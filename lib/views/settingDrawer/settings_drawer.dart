import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/addShopDialogue/add_shop_dialogue.dart';
import 'package:inventory_controller/components/animatedDialogue/animated_dialogue.dart';
import 'package:inventory_controller/components/commentCard/comment_card.dart';
import 'package:inventory_controller/components/customDropDown/custom_drop_down.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'dart:math' as math;

import 'package:inventory_controller/components/page_transition/page_transtion.dart';
import 'package:inventory_controller/main.dart';
import 'package:inventory_controller/views/newProduct/new_product.dart';
import 'package:inventory_controller/views/notificationDetail/notification_detail.dart';

class SettingsDrawer extends StatefulWidget {
  bool isCollapsed;
  final Function() changeIsCollapsed;
  SettingsDrawer({required this.isCollapsed, required this.changeIsCollapsed});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      child: Stack(children: [
        IgnorePointer(
          ignoring: widget.isCollapsed ? true : false,
          child: GestureDetector(
            onTap: !widget.isCollapsed ? widget.changeIsCollapsed : null,
            child: Container(
              color: Colors.transparent,
              width: width,
              height: height,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            width: width * 0.7,
            child: Scaffold(
              backgroundColor: theme.primaryColor,
              appBar: AppBar(
                backgroundColor: theme.primaryColor,
                elevation: 0,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: !widget.isCollapsed
                          ? Container(
                              child: LeadingButton(
                                color: lightGreyColor,
                                icon: Icons.arrow_forward,
                                iconColor: darkColor,
                                size: 37,
                                onPressed: widget.changeIsCollapsed,
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                  child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: lightGreyColor, shape: BoxShape.circle),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          '+ 250 78 710 4604',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Divider(
                  //   height: 1,
                  //   indent: 10,
                  //   endIndent: 10,
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: light1ShadeColor),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              themeBloc.setLightTheme();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: light1ShadeColor),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.wb_sunny),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('light')
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              themeBloc.setDarktTheme();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6),
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: light1ShadeColor),
                              // ),
                              child: Row(
                                children: [
                                  Icon(Icons.mode_night),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('dark')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(width: 5, color: primaryColor))),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Ikaze shop',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 1.0).animate(_controller),
                          child: IconButton(
                            icon: Icon(Icons.expand_more),
                            onPressed: () {
                              setState(() {
                                if (isExpanded) {
                                  _controller..reverse(from: 0.5);
                                } else {
                                  _controller..forward(from: 0.0);
                                }
                                isExpanded = !isExpanded;
                              });
                            },
                          ),
                        )),
                  ]),

                  ExpandedSection(
                      expand: isExpanded,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor.withOpacity(.5),
                            ),
                            child: InkWell(
                              onTap: () {
                                showNewDialog(
                                    context: context,
                                    child: AddShopDialogue(
                                      id: 2,
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Add shop',
                                      style: TextStyle(
                                          color: hardGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.add,
                                      color: hardGreyColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, right: 3, left: 15),
                            // width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_right,
                                  color: lightShadeColor,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Ikaze shop',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Divider(
                    height: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  FacePileContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        DropDownItem.first(
                            text: "Add new product",
                            iconData: Icons.add,
                            isSelected: false,
                            onPressed: () {
                              // Navigator.pop(context);

                              Navigator.push(
                                  context,
                                  PageTransition(
                                      curve: Curves.easeIn,
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      duration: Duration(milliseconds: 200),
                                      child: NewProductPage(),
                                      type: PageTransitionType.rightToLeft));
                              widget.changeIsCollapsed();
                            }),
                        DropDownItem(
                          text: "Search by range",
                          iconData: Icons.search,
                          isSelected: false,
                          onPressed: () {
                            Navigator.pushNamed(context, '/range_search');
                            widget.changeIsCollapsed();
                          },
                        ),
                        DropDownItem.last(
                          text: "Logout",
                          iconData: Icons.exit_to_app,
                          isSelected: true,
                          onPressed: () {
                            // Navigator.of(context).pushNamed('/signin',
                            //     arguments: ScreenArguments.redirect);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ]),
    );
  }
}

class FacePileContainer extends StatelessWidget {
  Widget _buildFacePileContainer() {
    return Container(
      color: lightGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                runSpacing: 10,
                children: [
                  FacePile(
                    isManager: true,
                  ),
                ],
              )),
          Divider(
            height: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                runSpacing: 10,
                children: [
                  FacePile(),
                  FacePile(),
                  FacePile(),
                  FacePile(),
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFacePileContainer();
  }
}

class FacePile extends StatelessWidget {
  final bool isManager;
  FacePile({this.isManager = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: lightGreyColor, shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/images/users/01.jpg',
                      fit: BoxFit.fill),
                )),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bihire',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: hardGreyColor),
                textAlign: TextAlign.center,
              ),
              isManager
                  ? Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Manager',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: hardGreyColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SizedBox(),
            ],
          ))
        ],
      ),
    );
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = false, required this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
