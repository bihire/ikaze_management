import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/commentCard/comment_card.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';

class NotificationDetail extends StatelessWidget {
  String noteDescription = 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: lightGreyColor))
              ),
              child: Column(
                children: [
                  Row(
                      children: [
                        Container(
                          child: LeadingButton(
                            color: lightShadeColor,
                            icon: Icons.arrow_back_ios_outlined,
                            iconColor: darkColor,
                            size: 37, // btnShadow: false
                          ),
                        ),
                        Container(
                          child: ConstrainedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                    // padding: EdgeInsets.all(7),
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.asset(
                                      "assets/images/tech.jpeg"),
                                ))),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 35,
                            maxWidth: 35,
                          ),
                        ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: Text('Lime new-entries', style: TextStyle(color: Colors.black),)
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
                  Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              noteDescription,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),

                ],),
            ),
            Expanded(
              child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 30),
          // itemCount: 1,

          itemBuilder: (ctx, index) {
            return CommentCard();
          },
        ),)

          ],)),
    );
  }
}
