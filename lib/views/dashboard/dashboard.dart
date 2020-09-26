import 'package:flutter/material.dart';
import 'package:inventory_controller/containers/homePage/daily_total.dart';
import 'package:inventory_controller/views/dashboard/samples/line_chart_sample1.dart';
import './chart.dart';
import './transactionTable.dart';

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
                Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    padding:EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    
                    width: MediaQuery.of(context).size.width * 1,
                    child: DailyTotal()
                    ),
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
          child: LineChartSample2()
          // Chart(
          //   data: data,
          // ),
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
          child: TransactionTable(),
        ),
      ],
    );
  }
}
