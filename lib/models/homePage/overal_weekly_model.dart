import 'package:intl/intl.dart';

class OveralWeeklyTransactionModel {
  String rangeName;
  DateTime startTime;
  DateTime endTime;
  String totalAmount;

  String get startTimeFormatted =>
      DateFormat.yMMMd().add_Hm().format(startTime);

  String get endTimeFormatted =>
      DateFormat.yMMMd().add_Hm().format(endTime);

  OveralWeeklyTransactionModel.fromJson(Map<String, dynamic> json)
      : rangeName = json['range_name'],
        endTime = DateTime.parse(json['range_dates'][0]['value']),
        startTime = DateTime.parse(json['range_dates'][1]['value']),
        totalAmount = json['total_amount'];
}
