import 'package:flutter/material.dart';
import 'package:inventory_controller/components/charts/line_chart_mothly.dart';
import 'package:inventory_controller/components/charts/line_chart_weekly.dart';

class HomeWeeklyChartScreen extends StatelessWidget {
  final String week_0;
  final String week_1;
  final String week_2;
  final String week_3;
  HomeWeeklyChartScreen({
    this.week_0,
    this.week_1,
    this.week_2,
    this.week_3,
  });
  @override
  Widget build(BuildContext context) {
    return LineChartWeekly(
      week_0: double.parse(week_0),
      week_1: double.parse(week_0),
      week_2: double.parse(week_2),
      week_3: double.parse(week_3),
      );
  }
}
