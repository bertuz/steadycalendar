import '../models/calendar.dart';

abstract class CalendarRepositoryInterface {
  Future<List<Calendar>> refreshCalendars();
}
