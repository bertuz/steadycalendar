import 'package:flutter/material.dart';

import '../config/styles.dart';

class SCFlatButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final Color? textColor;
  final Color? backgroundColor;

  const SCFlatButton(this.child,
      {this.textColor, this.backgroundColor, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white,
        backgroundColor: (backgroundColor ?? Styles.primaryHighlightColor),
        foregroundColor: (textColor ?? Colors.white),
        elevation: 1,
        textStyle: TextStyle(
            fontFamily: Styles.primaryFontRegular,
            fontWeight: Styles.primaryFontWeightLight),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
