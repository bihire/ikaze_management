import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/charts/line_chart_mothly.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';

makeDoubleDigit(number) => (number.toString()).length < 2
    ? '0' + number.toString()
    : number.toString();
String getDate(DateTime date, int number) {
  int curNum = date.month;
  if (curNum - number > 0)
    return '${makeDoubleDigit(curNum - number)}/${date.year}';
  return '${makeDoubleDigit(curNum - number + 12)}/${date.year - 1}';
}

class HomeMonthlyChartScreen extends StatelessWidget {
  final bool loading;
  final List<OveralMonthlyTransactionModel> overalMonthlyData;
  final error;
  HomeMonthlyChartScreen({
    this.loading,
    this.overalMonthlyData,
    this.error,
  });
  @override
  Widget build(BuildContext context) {
    final dateObj = DateTime.now();
    return loading == true ? Center(
      child:CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(lightGreyColor),
        strokeWidth: 2.0,
      )): LineChartMonthly(
      month_0: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 0))
          .totalAmount),
      month_1: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 1))
          .totalAmount),
      month_2: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 2))
          .totalAmount),
      month_3: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 3))
          .totalAmount),
      month_4: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 4))
          .totalAmount),
      month_5: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 5))
          .totalAmount),
      month_6: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 6))
          .totalAmount),
      month_7: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 7))
          .totalAmount),
      month_8: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 8))
          .totalAmount),
      month_9: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 9))
          .totalAmount),
      month_10: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 10))
          .totalAmount),
      month_11: double.parse((overalMonthlyData)
          .firstWhere((item) => item.month == getDate(dateObj, 11))
          .totalAmount),
    );
  }
}

// month_0: ((vm.overalMonthlyData).firstWhere((item) =>
//               item.month == getDate(dateObj, 0))).totalAmount,
//           month_1: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 1))).totalAmount,
//           month_2: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 2))).totalAmount,
//           month_3: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 3))).totalAmount,
//           month_4: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 4))).totalAmount,
//           month_5: ((vm.overalMonthlyData).firstWhere((item) =>
//               item.month == getDate(dateObj, 5))).totalAmount,
//           month_6: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 6))).totalAmount,
//           month_7: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 7))).totalAmount,
//           month_8: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 8))).totalAmount,
//           month_9: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 9))).totalAmount,
//           month_10: ((vm.overalMonthlyData).firstWhere((item) =>
//               item.month == getDate(dateObj, 10))).totalAmount,
//           month_11: ((vm.overalMonthlyData)
//               .firstWhere((item) => item.month == getDate(dateObj, 11))).totalAmount,
