import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:steadycalendar/components/sc_flat_button.dart';
import 'package:steadycalendar/components/sc_image_button.dart';
import 'package:steadycalendar/config/constants.dart';
import 'package:steadycalendar/config/styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../cal_pager/cal_pager.dart';

class LoginOptions extends StatefulWidget {
  static const String routeName = 'intro/login_options';

  const LoginOptions({super.key});

  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  initState() {
    _authStateSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;

      if (data.session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed(CalPager.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pink-plants@3x.png'),
                fit: BoxFit.cover)),
      ),
      Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SCFlatButton(
            const SCImageButton(
                'assets/images/google-logo-9808.png', 'Login with Google'),
            textColor: Styles.primaryHighlightColor,
            backgroundColor: Colors.white,
            onTap: () => _googleSignupTapped(context),
          ),
        ),
      )
    ]));
  }

  Future _googleSignupTapped(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        Provider.google,
        redirectTo: dotenv.get('SUPABASE_AUTH_CALLBACK', fallback: ''),
      );
    } catch (_) {
      context.showErrorSnackBar(
          message: 'Failed while signin in. Please retry');
    }
  }
}
