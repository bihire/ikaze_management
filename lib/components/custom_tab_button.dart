import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class CustomTabButton extends StatelessWidget {
  final String name;
  final double padding;
  final double margin;
  final double width;
  final Color color;
  final Color backGroundColor;
  final Icon icon;
  final int selectedPage;
  final int pageNum;
  final Function onPressed;
  CustomTabButton(
      {
        Key key,
      this.name,
      this.pageNum,
      this.onPressed,
      this.selectedPage,
      this.margin = 7,
      this.padding = 7.0,
      this.color = Colors.transparent,
      this.backGroundColor = primaryColor,
      this.icon,
      this.width}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(pageNum),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color:
                  selectedPage == pageNum ? backGroundColor.withOpacity(0.5) : lightGreyColor),
          width: width - (margin * 2),
          padding:
              EdgeInsets.symmetric(vertical: padding , horizontal: padding/ 2),
          margin: EdgeInsets.symmetric(horizontal: margin, vertical: margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? icon
                  : Container(
                      height: 0,
                    ),
              icon != null
                  ? SizedBox(
                      width: 10,
                    )
                  : Container(
                      height: 0,
                    ),
              Text(
                name,
                style: TextStyle(
                    color: selectedPage == pageNum ? color : darkColor),
              ),
            ],
          )),
    );
  }
}