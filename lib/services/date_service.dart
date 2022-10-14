import 'package:intl/intl.dart';

int daysInMonth(DateTime date) {
  var firstDayThisMonth = DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}

String getMonthName(DateTime date) {
  return DateFormat('MMMM yyyy').format(date);
}

String getDateToString(DateTime date) {
  return DateFormat('dd MMMM yyyy').format(date);
}

String getTime(DateTime date) {
  return DateFormat('HH:mm').format(date);
}
