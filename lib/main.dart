import '/screens/splash/splash_state.dart';

import 'app.dart';

void main() async {
  runAppWithOptions(
      envFileName: 'assets/.env.local', splashState: SplashState());
}
