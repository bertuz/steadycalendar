import 'package:flutter/widgets.dart';
import 'package:steadycalendar/repositories/cal_repo_interface.dart';

import '../models/calendar.dart';

class SessionProvider extends ChangeNotifier {
  List<Calendar> _cals = [];

  List<Calendar> get cals => _cals;
  CalendarRepositoryInterface calendarRepository;

  SessionProvider(this.calendarRepository);

  refreshCalendars() async {
    _cals = await calendarRepository.refreshCalendars();
    notifyListeners();
  }
}
