import 'package:intl/intl.dart';
import 'dart:collection';

typedef CalendarDate = DateTime;

typedef CalendarDates = HashMap<int, CalendarDate>;

const String CalendarDateFormat = 'yyyy-MM-dd';

String calendarDateToString(CalendarDate value) {
  return DateFormat(CalendarDateFormat).format(value);
}

CalendarDate stringToCalendarDate(String value) {
  return DateTime.parse("$value 00:00:00Z");
}
