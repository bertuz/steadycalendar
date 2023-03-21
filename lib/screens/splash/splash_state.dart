import 'package:flutter/material.dart';
import 'package:steadycalendar/config/constants.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;
import '../intro/intro.dart';

import 'splash.dart';

class SplashState extends State<Splash> {
  SplashState();

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((context) => _redirect());
  }

  Future<void> _redirect() async {
    if (!mounted) {
      return;
    }

    try {
      final session = await SupabaseAuth.instance.initialSession;

      // todo better this (context used on an async)
      // ignore: use_build_context_synchronously
      if (!context.mounted) return;

      provider.Provider.of<SessionProvider>(context, listen: false)
          .refreshCalendars();

      if (session != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(CalPager.routeName, (_) => false);
        return;
      }
    } catch (_) {
      context.showErrorSnackBar(
          message: 'An error occurred during the session');
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
        Intro.routeName, ModalRoute.withName(Splash.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  logOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Intro.routeName, (_) => false);
  }
}
