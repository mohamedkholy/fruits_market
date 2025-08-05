import 'package:intl/intl.dart';

class DateFormater {
  static String formatDateToString(DateTime dateTime) {
    return DateFormat("MMMM d, y").format(dateTime);
  }

  static DateTime formatStringToDate(String date) {
    return DateFormat("MMMM d, y").parse(date);
  }
}
