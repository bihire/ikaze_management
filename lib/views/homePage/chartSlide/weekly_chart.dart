import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/charts/line_chart_mothly.dart';
import 'package:inventory_controller/components/charts/line_chart_weekly.dart';
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';

makeDoubleDigit(number) => (number.toString()).length < 2
    ? '0' + number.toString()
    : number.toString();

String getDate(DateTime date, int number) {
  int curNum = date.month;
  if (curNum - number > 0)
    return '${makeDoubleDigit(curNum - number)}/${date.year}';
  return '${makeDoubleDigit(curNum - number + 12)}/${date.year - 1}';
}

class HomeWeeklyChartScreen extends StatelessWidget {
  final bool loading;
  final List<OveralWeeklyTransactionModel> overalWeeklyData;
  final error;
  HomeWeeklyChartScreen({
    @required this.loading,
    @required this.overalWeeklyData,
    @required this.error,
  });
  @override
  Widget build(BuildContext context) {
    return loading == true ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(lightGreyColor),
        strokeWidth: 2.0,
      )):LineChartWeekly(
      week_0: double.parse(((overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_0')).totalAmount),
          week_1: double.parse(((overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_1')).totalAmount),
          week_2: double.parse(((overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_2')).totalAmount),
          week_3: double.parse(((overalWeeklyData)
          .firstWhere((item) => item.rangeName == 'week_3')).totalAmount)
      );
  }
}
