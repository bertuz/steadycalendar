import 'package:steadycalendar/screens/splash/splash_state.dart';

class MockSplashState extends SplashState {
  MockSplashState();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      logOut(context);
    });
  }
}
