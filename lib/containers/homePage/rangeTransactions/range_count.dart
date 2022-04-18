import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/models/range_count.dart';

class RangeCount extends StatelessWidget {
  RangeCount({required this.rangeCount, required this.rangeDate});

  final RangeDate rangeDate;
  final RangeCountModel rangeCount;
  @override
  Widget build(BuildContext context) {
    var countFmt = new NumberFormat(",###", "en_US");
    var currencyFormat = new NumberFormat.currency(locale: "en_US", symbol: "");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: lightGreyColor))),
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: lightGreyColor),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: RichText(
                      text: TextSpan(
                          text:
                              '${countFmt.format(int.parse(rangeCount.totalCount))}  ',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                          children: [
                        TextSpan(
                          text: 'Transactions',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: hardGreyColor),
                        )
                      ])),
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 20, top: 15,
                bottom: 15,
              ),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: primaryColor, width: 5))
                  ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total sells: ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: hardGreyColor),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              '${countFmt.format(int.parse(rangeCount.soldTotal))}',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Text(
                            "rwf",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD9D9D9)),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total supplies: ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: hardGreyColor),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              '${countFmt.format(int.parse(rangeCount.newTotal))}',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Text(
                            "rwf",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD9D9D9)),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Divider(),
          ],
        ),
      ),
    );
  }
}
