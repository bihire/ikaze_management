import 'package:flutter/material.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';

class HomeDailyChartScreen extends StatelessWidget {
  final String day_0;
  final String day_1;
  final String day_2;
  final String day_3;
  final String day_4;
  final String day_5;
  final String day_6;
  HomeDailyChartScreen({
    this.day_0,
    this.day_1,
    this.day_2,
    this.day_3,
    this.day_4,
    this.day_5,
    this.day_6,
  });
  @override
  Widget build(BuildContext context) {
    return BarChartSample1(
      day_0: day_0,
      day_1: day_1,
      day_2: day_2,
      day_3: day_3,
      day_4: day_4,
      day_5: day_5,
      day_6: day_6,
    );
  }
}
