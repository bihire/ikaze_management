import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_controller/models/range_count.dart';

class RangeCount extends StatelessWidget {
  RangeCount({this.rangeCount, this.rangeDate});

  final Map rangeDate;
  final RangeCountModel rangeCount;
  @override
  Widget build(BuildContext context) {
    var countFmt = new NumberFormat(",###", "en_US");
    var currencyFormat = new NumberFormat.currency(locale: "en_US", symbol: "");
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 7.0),
                child: Text(
                  '${countFmt.format(int.parse(rangeCount.totalCount))}',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.green),
                  textAlign: TextAlign.right,
                ),
              ),
              Text(
                "Transactions",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFD9D9D9)),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total sells: ",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFD9D9D9)),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 7.0),
                    child: Text(
                      '${currencyFormat.format(double.parse(rangeCount.soldTotal))}',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Text(
                    "rwf",
                    style: TextStyle(
                        fontSize: 17.0,
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
                    color: Color(0xFFD9D9D9)),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 7.0),
                    child: Text(
                      '${currencyFormat.format(double.parse(rangeCount.newTotal))}',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Text(
                    "rwf",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD9D9D9)),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
