import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/repositories/cal_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/session_provider.dart';
import 'repositories/cal_repo_interface.dart';
import 'screens/cal_pager/cal_pager.dart';
import 'screens/intro/intro.dart';
import 'screens/login_options/login_options.dart';
import 'screens/splash/splash.dart';
import 'screens/splash/splash_state.dart';

Future<void> runAppWithOptions(
    {String envFileName = 'assets/.env',
    CalendarRepositoryInterface calendarRepository = const CalendarRepository(),
    required SplashState splashState}) async {
  await dotenv.load(fileName: envFileName, mergeWith: {});

  await Supabase.initialize(
      url: 'http://localhost:54321',
      // url:
      //     'https://${dotenv.get('SUPABASE_PROJECT_ID', fallback: '')}.supabase.co',
      anonKey: dotenv.get('SUPABASE_ANON_KEY', fallback: ''),
      debug: false);
  runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepository),
      child: App(splashState)));
}

class App extends StatelessWidget {
  final State<Splash> splashState;

  const App(this.splashState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Steady Calendar',
        initialRoute: Splash.routeName,
        routes: {
          Splash.routeName: (_) => Splash(splashState),
          Intro.routeName: (_) => const Intro(),
          LoginOptions.routeName: (_) => const LoginOptions(),
          CalPager.routeName: (_) => const CalPager()
        });
  }
}
