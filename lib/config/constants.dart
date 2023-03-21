import 'package:flutter/material.dart';

import '../models/calendar_color.dart';

String baseBackgroundImageUrl(String supabaseProjectID) =>
    'http://localhost:54321/storage/v1/object/public/backgrounds';

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

List<CalendarColor> colors = [
  CalendarColor('FF0000', 'Harmony'),
  CalendarColor('00FF00', 'Forest'),
  CalendarColor('0000FF', 'Sky'),
];

List<String> backgrounds = ['bamboo@3x.png', 'apples-on-tree@3x.png'];
