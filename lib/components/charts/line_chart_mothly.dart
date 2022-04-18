import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';

Map<int, String> getMonthName = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec',
};

int now = DateTime.now().month;
int getMonthNum(int index) {
  if (now - index > 0) {
    return now - index;
  }
  if (now - index == 0) {
    return 12;
  }
    return 12 - (index - now);
}

class LineChartMonthly extends StatefulWidget {
  final double month_0;
  final double month_1;
  final double month_2;
  final double month_3;
  final double month_4;
  final double month_5;
  final double month_6;
  final double month_7;
  final double month_8;
  final double month_9;
  final double month_10;
  final double month_11;
  LineChartMonthly({
    required this.month_0,
    required this.month_1,
    required this.month_2,
    required this.month_3,
    required this.month_4,
    required this.month_5,
    required this.month_6,
    required this.month_7,
    required this.month_8,
    required this.month_9,
    required this.month_10,
    required this.month_11,
  });
  @override
  _LineChartMonthlyState createState() => _LineChartMonthlyState();
}

class _LineChartMonthlyState extends State<LineChartMonthly> {
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
      
      gridData: FlGridData(
        // show: false,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: lightGreyColor,
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
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return getMonthName[getMonthNum(11)]!;
              case 1:
                return getMonthName[getMonthNum(10)]!;
              case 2:
                return getMonthName[getMonthNum(9)]!;
              case 3:
                return getMonthName[getMonthNum(8)]!;
              case 4:
                return getMonthName[getMonthNum(7)]!;
              case 5:
                return getMonthName[getMonthNum(6)]!;
              case 6:
                return getMonthName[getMonthNum(5)]!;
              case 7:
                return getMonthName[getMonthNum(4)]!;
              case 8:
                return getMonthName[getMonthNum(3)]!;
              case 9:
                return getMonthName[getMonthNum(2)]!;
              case 10:
                return getMonthName[getMonthNum(1)]!;
              case 11:
                return getMonthName[getMonthNum(0)]!;
              default:
                return '';
            }
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
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
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(left: BorderSide(color: lightGreyColor), right: BorderSide(color: lightGreyColor))),
      minX: 0,
      // maxX: 11,
      minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.month_11),
            FlSpot(1, widget.month_10),
            FlSpot(2, widget.month_9),
            FlSpot(3, widget.month_8),
            FlSpot(4, widget.month_7),
            FlSpot(5, widget.month_6),
            FlSpot(6, widget.month_5),
            FlSpot(7, widget.month_4),
            FlSpot(8, widget.month_3),
            FlSpot(9, widget.month_2),
            FlSpot(10, widget.month_1),
            FlSpot(11, widget.month_0),
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
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
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
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 1:
                return 'Feb';
              case 2:
                return 'Mar';
              case 3:
                return 'Apr';
              case 4:
                return 'May';
              case 5:
                return 'Jun';
              case 6:
                return 'Jul';
              case 7:
                return 'Aug';
              case 8:
                return 'Sep';
              case 9:
                return 'Oct';
              case 10:
                return 'Nov';
              case 11:
                return 'Dec';
              default:
                return '';
            }
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
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
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(1, 3.44),
            FlSpot(2, 3.44),
            FlSpot(3, 3.44),
            FlSpot(4, 3.44),
            FlSpot(5, 3.44),
            FlSpot(6, 3.44),
            FlSpot(7, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9, 3.44),
            FlSpot(10, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
