import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';


makeDoubleDigit(number) => (number.toString()).length < 2
    ? '0' + number.toString()
    : number.toString();

String getDate(DateTime date, int number) {
  int curNum = date.month;
  if (curNum - number > 0)
    return '${makeDoubleDigit(curNum - number)}/${date.year}';
  return '${makeDoubleDigit(curNum - number + 12)}/${date.year - 1}';
}

class DetailDailyChartScreen extends StatelessWidget {
  final bool loading;
  final List<OveralDailyTransactionModel> overalDailyData;
  final error;
  DetailDailyChartScreen({
    @required this.loading,
    @required this.overalDailyData,
    @required this.error,
  });
  @override
  Widget build(BuildContext context) {
    return loading == true ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(lightGreyColor),
        strokeWidth: 2.0,
              ),
    ): BarChartContainer(
      day_0: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_0')).totalAmount,
      day_1: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_1')).totalAmount,
      day_2: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_2')).totalAmount,
      day_3: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_3')).totalAmount,
      day_4: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_4')).totalAmount,
      day_5: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_5')).totalAmount,
      day_6: ((overalDailyData)
          .firstWhere((item) => item.rangeName == 'day_6')).totalAmount,
    );
  }
}
