import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class LineChartWeekly extends StatefulWidget {
  final double week_0;
  final double week_1;
  final double week_2;
  final double week_3;
  LineChartWeekly({
    @required this.week_0,
    @required this.week_1,
    @required this.week_2,
    @required this.week_3,
  });
  @override
  _LineChartWeeklyState createState() => _LineChartWeeklyState();
}

class _LineChartWeeklyState extends State<LineChartWeekly> {
  List<Color> gradientColors = [
    const Color(0xFFBEB501),
    const Color(0xFFBEB501),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.47,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(
                //   Radius.circular(5),
                // ),
                // color: Color(0xff232d37)
                ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.black.withOpacity(0.5) : Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      // lineTouchData: LineTouchData(enabled: true,),

      gridData: FlGridData(
        // show: false,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: lightGreyColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          // reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'week four';
              case 1:
                return 'Week three';
              case 2:
                return 'Last week';
              case 3:
                return 'This week';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            color: lightGreyColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          // reservedSize: 28,
          // margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(left: BorderSide(color: lightGreyColor), right: BorderSide(color: lightGreyColor))),
      // minX: 0,
      // maxX: 11,
      // minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.week_3),
            FlSpot(1, widget.week_2),
            FlSpot(2, widget.week_1),
            FlSpot(3, widget.week_0),
          ],
          isCurved: true,
          curveSmoothness: 0.07,
          preventCurveOverShooting: true,
          colors: gradientColors,
          barWidth: 3, 
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    final double avg =
        (widget.week_0 + widget.week_1 + widget.week_2 + widget.week_3) / 4;
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: false,
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: lightGreyColor,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'week four';
              case 1:
                return 'Week three';
              case 2:
                return 'Last week';
              case 3:
                return 'This week';
              default:
                return '';
            }
          },
          // margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          // reservedSize: 28,
          // margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      // maxX: 11,
      minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, avg),
            FlSpot(1, avg),
            FlSpot(2, avg),
            FlSpot(3, avg),
          ],
          isCurved: true,
          // colors: [
          //   ColorTween(begin: gradientColors[0], end: gradientColors[1])
          //       .lerp(0.2),
          //   ColorTween(begin: gradientColors[0], end: gradientColors[1])
          //       .lerp(0.2),
          // ],
          // isCurved: true,
          curveSmoothness: 0.07,
          preventCurveOverShooting: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
