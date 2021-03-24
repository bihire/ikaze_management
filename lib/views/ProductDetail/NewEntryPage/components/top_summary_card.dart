import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/cardFlipper/card_flipper.dart';
import 'package:skeleton_text/skeleton_text.dart';

class TopSummaryCard extends StatelessWidget {
  int _value = 10;
  TopSummaryCard({
    Key key,
    this.loading,
    this.dailyTotal,
    // this.isNextPageAvailable,
    // this.transactions,
    // this.refresh,
    // this.loadNextPage,
    this.error,
  });

  final bool loading;
  final String dailyTotal;
  // final bool isNextPageAvailable;
  // final transactions;
  // final Function refresh;
  // final Function loadNextPage;
  final bool error;
  @override
  Widget build(BuildContext context) {
    print(dailyTotal);
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 0.0),
                      child: loading == true
                          ? SkeletonAnimation(
                              child: Container(
                                width: 220.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                AnimatedFlipCounter(
                                  duration: Duration(milliseconds: 500),
                                  value: int.parse(dailyTotal),
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
                      child: loading == true
                          ? SkeletonAnimation(
                              child: Container(
                                margin: EdgeInsets.only(top: 6.0),
                                width: 100.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                              ),
                            )
                          : Text(
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
                // Row(
                //   children: [
                //     FlatButton(
                //         onPressed: () {
                //           setState(() {
                //             _value = _value + 10000;
                //           });
                //         },
                //         child: Icon(Icons.add)),
                //     FlatButton(
                //         onPressed: () {
                //           setState(() {
                //             _value = _value - 10000;
                //           });
                //         },
                //         child: Icon(Icons.remove))
                //   ],
                // )
              ],
            )
            // Column(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: <Widget>[
            //           Container(
            //               margin: const EdgeInsets.only(top: 40.0),
            //               padding:
            //                   EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            //               decoration: BoxDecoration(
            //                   // color: Colors.white,
            //                   // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
            //                   ),
            //               width: MediaQuery.of(context).size.width * 1,
            //               child: Column(
            //                 children: <Widget>[
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     children: <Widget>[
            //                       Padding(
            //                         padding: EdgeInsets.only(right: 7.0),
            //                         child: Text(
            //                           "240.00 ",
            //                           style: TextStyle(
            //                               fontSize: 28.0,
            //                               fontWeight: FontWeight.w600),
            //                           textAlign: TextAlign.right,
            //                         ),
            //                       ),
            //                       Text(
            //                         "rwf",
            //                         style: TextStyle(
            //                             fontSize: 18.0, fontWeight: FontWeight.w600),
            //                         textAlign: TextAlign.right,
            //                       ),
            //                     ],
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     children: <Widget>[
            //                       Text(
            //                         "Sell unit price",
            //                         style: TextStyle(
            //                             fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
            //                         textAlign: TextAlign.right,
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               )),
            //               Container(
            //                 margin: const EdgeInsets.only(top: 18.0),
            //                 padding:
            //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            //                 decoration: BoxDecoration(
            //                     ),
            //                 width: MediaQuery.of(context).size.width * 1,
            //                 child: Column(
            //                   children: <Widget>[
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: <Widget>[
            //                         Padding(
            //                           padding: EdgeInsets.only(right: 7.0),
            //                           child: Text(
            //                             "14,000.00 ",
            //                             style: TextStyle(
            //                                 fontSize: 34.0,
            //                                 fontWeight: FontWeight.w600),
            //                             textAlign: TextAlign.right,
            //                           ),
            //                         ),
            //                         Text(
            //                           "rwf",
            //                           style: TextStyle(
            //                               fontSize: 18.0, fontWeight: FontWeight.w600),
            //                           textAlign: TextAlign.right,
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: <Widget>[
            //                         Text(
            //                           "Today's sells",
            //                           style: TextStyle(
            //                               fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
            //                           textAlign: TextAlign.right,
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 )),
            //         ],
            //       ),
            ),
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
                      child: loading == true
                          ? SkeletonAnimation(
                              child: Container(
                                width: 220.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                AnimatedFlipCounter(
                                  duration: Duration(milliseconds: 500),
                                  value: int.parse(dailyTotal),
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
                      child: loading == true
                          ? SkeletonAnimation(
                              child: Container(
                                margin: EdgeInsets.only(top: 6.0),
                                width: 100.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                              ),
                            )
                          : Text(
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
            )
       ),
      ],
    );
  }
}
