import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/models/money_transactions.dart';

class SoldSummaryCard extends StatelessWidget {
  final MoneyTransactionModel? lastSupply;
  SoldSummaryCard({required this.lastSupply});
  @override
  Widget build(BuildContext context) {
    print(lastSupply);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.grey[200],
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            color: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5),
            //     side: BorderSide(width: 0.7, color: Colors.green)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "The last stock bought",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: hardGreyColor),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 7.0),
                        child: Text(
                          '${lastSupply!.quantity}',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        "kg",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: hardGreyColor),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Bought at: ",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: hardGreyColor),
                        textAlign: TextAlign.right,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              '${lastSupply!.unitPrice}',
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Text(
                            "rwf/kg",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: hardGreyColor),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total: ",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: hardGreyColor),
                        textAlign: TextAlign.right,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              '${double.parse(lastSupply!.quantity) * lastSupply!.unitPrice}',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Text(
                            "rwf",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: hardGreyColor),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
