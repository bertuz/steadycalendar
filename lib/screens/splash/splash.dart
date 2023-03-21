import 'package:flutter/material.dart';
import 'package:steadycalendar/config/constants.dart';
import 'package:steadycalendar/providers/session_provider.dart';
import 'package:steadycalendar/screens/cal_pager/cal_pager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;
import '../intro/intro.dart';

class Splash extends StatefulWidget {
  static final routeName = '/';
  final State<Splash> state;

  const Splash(this.state, {super.key});

  @override
  State<StatefulWidget> createState() => state;
}
