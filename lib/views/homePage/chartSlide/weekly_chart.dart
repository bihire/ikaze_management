import 'package:flutter/material.dart';

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
    return Column(children: [Text(week_0), Text(week_1),Text(week_2),Text(week_3),],);
  }
}
