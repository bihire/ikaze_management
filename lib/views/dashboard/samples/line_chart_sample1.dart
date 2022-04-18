
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
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
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
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
                  fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      // lineTouchData: LineTouchData(enabled: false),
      
      gridData: FlGridData(
        // show: false,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
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
          // reservedSize: 22,
          // textStyle:
              // const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 10),
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
          // margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          // textStyle: const TextStyle(
          //   color: Color(0xff67727d),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 15,
          // ),
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
      borderData: FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      // maxX: 11,
      minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
              spots: [
                FlSpot(0, 4),
                FlSpot(1, 3.5),
                FlSpot(2, 4.5),
                FlSpot(3, 1),
                FlSpot(4, 4),
                FlSpot(5, 6),
                FlSpot(6, 6.5),
                FlSpot(7, 6),
                FlSpot(8, 4),
                FlSpot(9, 6),
                FlSpot(10, 6),
                FlSpot(11, 17),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
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
          // textStyle:
              // const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 10),
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
          // textStyle: const TextStyle(
          //   color: Color(0xff67727d),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 15,
          // ),
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
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
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
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}