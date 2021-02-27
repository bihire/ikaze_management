import 'package:intl/intl.dart';

class OveralMonthlyTransactionModel {
  String month;
  // DateTime startTime;
  // DateTime endTime;
  String totalAmount;

  // String get startTimeFormatted =>
  //     DateFormat.yMMMd().add_Hm().format(startTime);

  // String get endTimeFormatted =>
  //     DateFormat.yMMMd().add_Hm().format(endTime);

  OveralMonthlyTransactionModel.fromJson(Map<String, dynamic> json)
      : month = json['month'],
        // endTime = DateTime.parse(json['range_dates'][0]['value']),
        // startTime = DateTime.parse(json['range_dates'][1]['value']),
        totalAmount = json['total_amount'];
}
