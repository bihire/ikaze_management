import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/containers/productList/product_list_container.dart';
import 'package:inventory_controller/views/homePopup/popupAppbar_screen.dart';
// import 'package:task_force_challenge/common/constants.dart';
// import 'package:task_force_challenge/components/cardLeadingTitle/card_leading_title.dart';

class SelectProduct extends StatelessWidget {
  void _tripShowModalBottomSheet(context) {
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
                  Center(
                    child: PopupAppbarScreen(underLine: false),
                  ),
                  Expanded(
                      child: ProductListContainer())
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 350),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
          ),
            onTap: () {
              _tripShowModalBottomSheet(context);
            },
            child: Container(
              
              decoration: BoxDecoration(
                color: lightGreyColor,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Choose product',
                          style: TextStyle(color: hardGreyColor))),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: hardGreyColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 40,
                  ),
                  SizedBox(height: 5),
                  Container(padding: EdgeInsets.only(right: 4) ,child: Text('Unit price', style: TextStyle(color: hardGreyColor, fontSize: 12), textAlign: TextAlign.right,))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
