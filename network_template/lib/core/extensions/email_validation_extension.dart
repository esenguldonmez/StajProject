import 'package:intl/intl.dart';

extension DateIntlFormatter on DateFormat {
  static String yearMonthDayFormatUSWith(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  static String ddMMYYYYFormat(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String yearMonthDayFormatTRWith(DateTime date) {
    return DateFormat.yMd('tr-TR').format(date);
  }
}