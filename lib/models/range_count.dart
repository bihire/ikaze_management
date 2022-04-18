class RangeCountModel {
  String totalCount;
  String soldTotal;
  String newTotal;

  RangeCountModel.fromJson(Map<String, dynamic> json)
      : totalCount = json['total_cnt'],
        soldTotal = json['soldtotal'],
        newTotal = json['newtotal'];
}

class RangeDate {
  DateTime rangeFromDate;
  DateTime rangeToDate;

  RangeDate({required this.rangeFromDate, required this.rangeToDate});
}
