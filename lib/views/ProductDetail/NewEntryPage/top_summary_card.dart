import 'package:flutter/material.dart';

class TopSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      color: Colors.white,
      child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
                        ),
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 7.0),
                              child: Text(
                                "240.00 ",
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Text(
                              "rwf",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Sell unit price",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    )),
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
                          ),
                      width: MediaQuery.of(context).size.width * 1,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text(
                                  "14,000.00 ",
                                  style: TextStyle(
                                      fontSize: 34.0,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Text(
                                "rwf",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Today's sells",
                                style: TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      )),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0),
                      //   child: Divider(
                      //     height: 1.0,
                      //   ),
                      // ),
                      
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 18.0),
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      //   decoration: BoxDecoration(
                      //       // color: Colors.white,
                      //       // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
                      //       ),
                      //   width: MediaQuery.of(context).size.width * 1,
                      //   child: Column(
                      //     children: <Widget>[
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: <Widget>[
                      //           Padding(
                      //             padding: EdgeInsets.only(right: 7.0),
                      //             child: Text(
                      //               "60,000 ",
                      //               style: TextStyle(
                      //                   fontSize: 24.0,
                      //                   fontWeight: FontWeight.w500),
                      //               textAlign: TextAlign.left,
                      //             ),
                      //           ),
                      //           Text(
                      //             "kg",
                      //             style: TextStyle(
                      //                 fontSize: 15.0, fontWeight: FontWeight.w600),
                      //             textAlign: TextAlign.right,
                      //           ),
                      //         ],
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: <Widget>[
                      //           Text(
                      //             "Remaining stock",
                      //             style: TextStyle(
                      //                 fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFD9D9D9)),
                      //             textAlign: TextAlign.right,
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   )),
                
              ],
            ),
    );
  }
}