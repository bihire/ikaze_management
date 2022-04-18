import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';



void tripShowModalBottomSheet(BuildContext context, Widget child) {
  // showRoundedModalBottomSheet(
  //     context: context,
  //     builder: (context) => _buildBottomSheetChild()
  // );
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: height * 0.64,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 30, maxWidth: width * 0.4),
                    child: Container(
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.only(bottom: 7),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey,
                        ),
                        height: 5,
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: PopupAppbarScreen(underLine: false),
                // ),
                Expanded(
                    child: child)
              ],
            ),
          ),
        );
      });
}
