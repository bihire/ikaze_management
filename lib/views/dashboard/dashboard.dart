import 'package:flutter/material.dart';
import './chart.dart';
import './line_chart_page.dart';

final data = [55.0, 90.0, 50.0, 40.0, 35.0, 55.0, 70.0, 100.0];

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   margin: const EdgeInsets.only(top: 20.0),
                //   decoration: BoxDecoration(
                //     // color: Colors.white,
                //     // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
                //   ),
                //   width: MediaQuery.of(context).size.width * 1,
                //   child: Text("Home", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
                // ),
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
                                "14,000 ",
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
                              "Today's revenue",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 10.0),
                              child: Text('Overall(Monthly)'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 10.0),
                              child: Text('Overall(Weekly)'),
                            ),
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 10.0),
                              child: Text('Overall(Daily)'),
                            ),
                          )
                        ],
                      )),
                )
              ],
            )),
        Container(
          width: width * 0.8,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          color: Colors.white,
          height: 250,
          margin: const EdgeInsets.only(top: 10.0),
          child: Chart(
            data: data,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          margin: const EdgeInsets.only(top: 10.0),
          child: Text('History', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          margin: const EdgeInsets.only(top: 10.0),
          color: Colors.white,
          height: 250,
          child: Text('History', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
}
