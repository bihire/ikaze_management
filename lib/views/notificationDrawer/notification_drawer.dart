import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/commentCard/comment_card.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'dart:math' as math;

import 'package:inventory_controller/components/page_transition/page_transtion.dart';
import 'package:inventory_controller/views/notificationDetail/notification_detail.dart';

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                child: GestureDetector(
                  onTap: () => {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ExploreSearch()),
                    // )
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightGreyColor),
                    height: 35,
                  ),
                ),
              ),
            ),
            // Container(
            //   child: LeadingButton(
            //     color: lightShadeColor,
            //     icon: Icons.send,
            //     margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
            //     rotate: -20 * math.pi / 180,
            //     iconColor: darkColor,
            //     onPressed: ()=> {},
            //     size: 37, // btnShadow: false
            //   ),
            // ),
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
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 30),
          // itemCount: 1,

          itemBuilder: (ctx, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: NotificationDetail(),
                          childCurrent: this,
                          type: PageTransitionType.rightToLeftJoined));
                },
                child: CommentCard());
          },
        ),
      ),
    );
  }
}
