import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:steadycalendar/app.dart';

import 'mock_calendar_repository.dart';
import 'mock_splash_state.dart';

const testEnvFile = 'assets/.env.test';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('happy path tests', () {
    testWidgets('login and edit calendars', (WidgetTester widgetTester) async {
      final calRepo = MockCalendarRepository();
      final splashState = MockSplashState();

      await runAppWithOptions(
          envFileName: testEnvFile,
          calendarRepository: calRepo,
          splashState: splashState);
      await widgetTester.pumpAndSettle();

      final getStarted = find.widgetWithText(ElevatedButton, 'Get Started');
      await widgetTester.tap(getStarted);
      await widgetTester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);

      // await splashState.login();
      await widgetTester.pumpAndSettle();
    });
  });
}
