import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_view/cal_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../intro/intro.dart';

class CalPager extends StatelessWidget {
  static const String routeName = '/cal_pager';

  const CalPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(builder: (context, session, _) {
      return Scaffold(
        body: Stack(
          children: [
            PageView(
                children: session.cals.map((cal) => CalView(cal)).toList()),
            (Supabase.instance.client.auth.currentUser != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Supabase.instance.client.auth.currentUser!.id),
                        SafeArea(
                          child: TextButton(
                              onPressed: () => _logOut(context),
                              child: const Text("Log out")),
                        )
                      ],
                    ),
                  )
                : Container())
          ],
        ),
      );
    });
  }

  _logOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    // todo context here? mm...
    // ignore: use_build_context_synchronously
    if (!context.mounted) return;

    Navigator.of(context)
        .pushNamedAndRemoveUntil(Intro.routeName, (_) => false);
  }
}
