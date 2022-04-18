import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/cardFlipper/card_flipper.dart';

class DailySalesScreen extends StatelessWidget {
  final int dailySales;
  DailySalesScreen(this.dailySales);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 0.0),
              child: Row(
                children: [
                  AnimatedFlipCounter(
                    duration: Duration(milliseconds: 500),
                    value: dailySales,
                    /* pass in a number like 2014 */
                    color: Colors.black,
                    size: 40,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "rwf",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: hardGreyColor),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                "Today's revenue",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: hardGreyColor),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
