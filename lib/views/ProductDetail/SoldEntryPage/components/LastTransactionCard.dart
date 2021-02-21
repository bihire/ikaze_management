import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/components/sold_summary_card.dart';

class LastTransactionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LastTransactionCardState();
}

class LastTransactionCardState extends State<LastTransactionCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: width,
      // height: 400,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: SoldSummaryCard()
          ),
      Container(
        margin: const EdgeInsets.only(top: 18.0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
        margin: const EdgeInsets.only(top: 7.0),
        padding:
            EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        decoration: BoxDecoration(
            // color: Colors.white,
            // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
            ),
        // width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 7.0),
                  child: Text(
                    "60,000 ",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "kg",
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Remaining stock",
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        )),
        Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding:
            EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            // color: Colors.white,
            // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
            ),
        // width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Text(
                    "60,000 ",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "kg",
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Stock before refill",
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        )),
          ],
        ),
      ),
      
        
      ],),
    );
  }
}
