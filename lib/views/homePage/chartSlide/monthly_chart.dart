import 'package:flutter/material.dart';
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';

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
    return Column(children: [],);
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
