import 'package:steadycalendar/config/constants.dart';
import 'package:steadycalendar/models/calendar.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';

class MockCalendarRepository implements CalendarRepositoryInterface {
  List<Calendar> cals = [
    Calendar(
        id: 1,
        name: 'Untitled1',
        colorHex: colors.first.hex,
        backgroundSlug: backgrounds.first),
    Calendar(
        id: 2,
        name: 'untitled2',
        colorHex: colors.last.hex,
        backgroundSlug: backgrounds.last)
  ];

  @override
  Future<List<Calendar>> refreshCalendars() async {
    return cals;
  }
}
