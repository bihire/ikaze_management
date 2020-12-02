makeDoubleDigit(number) => (number.toString()).length < 2
    ? '0' + number.toString()
    : number.toString();

class Utils {
  static dateFormater(date) {
    var monthsLong = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    var monthsShort = [
      "jan",
      "feb",
      "mar",
      "apr",
      "may",
      "jun",
      "jul",
      "aug",
      "sep",
      "oct",
      "nov",
      "dec"
    ];

    final dateObj = DateTime.now();
    final currentMonth = makeDoubleDigit(dateObj.month);
    final currentMonthName = monthsLong[dateObj.month];
    final currentDay = dateObj.day;
    final currentYear = dateObj.year;

    final sentDate = date;
    final sentMonth = makeDoubleDigit(sentDate.month);
    final sentMonthName = monthsShort[sentDate.month]; //months from 1-12
    final sentDay = sentDate.day;
    final sentYear = sentDate.year;
    final sentHour = sentDate.hour;
    final sentMinutes = sentDate.minute;

    if (sentYear == currentYear &&
        sentMonth == currentMonth &&
        sentDay == currentDay)
      return {
        'dateClass': 'today',
        'dateTime':
            '${makeDoubleDigit(sentHour)}:${makeDoubleDigit(sentMinutes)}'
      };
    if (sentYear == currentYear &&
        sentMonth == currentMonth &&
        sentDay == (currentDay - 1))
      return {
        'dateClass': 'yesterday',
        'dateTime': '${sentMonthName} ${makeDoubleDigit(sentDay)}'
      };
    if (sentYear == currentYear &&
        sentMonth == currentMonth &&
        sentDay >= (currentDay - 6))
      return {
        'dateClass': 'earlierthisWeek',
        'dateTime': '${sentMonthName} ${makeDoubleDigit(sentDay)}'
      };
    if (sentYear == currentYear)
      return {
        'dateClass': '$sentMonthName',
        'dateTime': '$sentMonthName ${makeDoubleDigit(sentDay)}'
      };

    return {
      'dateClass': '$sentYear',
      'dateTime':
          '$sentYear/${makeDoubleDigit(sentMonth)}/${makeDoubleDigit(sentDay)}'
    };
  }

  static dateToString(DateTime date) {
    final dateObj = DateTime.now();
    final currentMonth = dateObj.month;
    final currentDay = dateObj.day;
    final currentYear = dateObj.year;

    final sentMonth = date.month;
    final sentYear = date.year;
    final sentDay = date.day;

    if (sentYear == currentYear &&
        sentMonth == currentMonth &&
        sentDay == currentDay) return 'today';

    return '$sentYear-${makeDoubleDigit(sentMonth)}-${makeDoubleDigit(sentDay)}';
  }

  static formatToDate(DateTime date) {
    final sentMonth = date.month;
    final sentYear = date.year;
    final sentDay = date.day;
    return '$sentYear-${makeDoubleDigit(sentMonth)}-${makeDoubleDigit(sentDay)}';
  }
}
