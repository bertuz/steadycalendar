import 'package:flutter/material.dart';

class Styles {
  static const primaryTextColor = Colors.green;
  static const primaryHighlightColor = Colors.black;
  static final Color tertiaryTextColor = hexToColor('888888');

  static const primaryFontRegular = 'Muli';
  static const String secondaryFontRegular = 'Quicksand';

  static const primaryFontWeightLight = FontWeight.w300;

  static const primaryHeaderFontSize = 15.0;
  static const double smallTextFontSize = 18.0;
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
}
