import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/cardFlipper/card_flipper.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:skeleton_text/skeleton_text.dart';

class TopSummaryCard extends StatelessWidget {
  TopSummaryCard(
      {Key? key, required this.dailySales, required this.productInfo});

  final int dailySales;
  final ProductInfoModel productInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/product_supplies',arguments: productInfo),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: light1ShadeColor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text('Supplies History'),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 0.0),
                      child: Row(
                        children: [
                          AnimatedFlipCounter(
                            duration: Duration(milliseconds: 500),
                            value: productInfo.unitPrice,
                            /* pass in a number like 2014 */
                            color: Colors.black,
                            size: 30,
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
                        "Unit Price",
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
            )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            color: Colors.white,
            child: Column(
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
            )),
      ],
    );
  }
}

class TopSummaryCardLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: SkeletonAnimation(
                          child: Container(
                            width: 220.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: SkeletonAnimation(
                          child: Container(
                            margin: EdgeInsets.only(top: 6.0),
                            width: 100.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: SkeletonAnimation(
                          child: Container(
                            width: 220.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: SkeletonAnimation(
                          child: Container(
                            margin: EdgeInsets.only(top: 6.0),
                            width: 100.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
