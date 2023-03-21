import 'package:steadycalendar/repositories/cal_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/calendar.dart';

class CalendarRepository implements CalendarRepositoryInterface {
  const CalendarRepository();

  @override
  Future<List<Calendar>> refreshCalendars() async {
    try {
      final response = await Supabase.instance.client
          .from('calendars')
          .select('id, name, color, background_slug, calendar_dates (date)');

      return response.map<Calendar>((e) => Calendar.fromJson(e)).toList();
    } catch (e) {
      throw (e.toString());
    }
  }
}
