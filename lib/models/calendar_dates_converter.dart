import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

import 'calendar_date.dart';

class CalendarDatesConverter
    implements JsonConverter<CalendarDates?, List<dynamic>?> {
  const CalendarDatesConverter();

  @override
  HashMap<int, DateTime> fromJson(List<dynamic>? json) {
    final CalendarDates datesHash = CalendarDates();

    if (json == null) {
      return datesHash;
    }

    json.forEach((value) {
      final dtMap = value as Map<String, dynamic>;
      if (dtMap.values.isNotEmpty) {
        final dateString = dtMap.values.first;
        final date = stringToCalendarDate(dateString);

        datesHash[date.hashCode] = date;
      }
    });

    return datesHash;
  }

  @override
  List? toJson(object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
