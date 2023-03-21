import 'package:flutter/cupertino.dart';

import '../../../config/styles.dart';
import '../../../models/calendar.dart';
import 'background.dart';
import 'month_grid.dart';

class CalView extends StatelessWidget {
  final Calendar cal;

  const CalView(this.cal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Background(cal.backgroundSlug)],
        ),
        Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.65)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                child: Text(
                  cal.name,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: hexToColor(cal.colorHex),
                      fontFamily: Styles.primaryFontRegular,
                      fontSize: Styles.primaryHeaderFontSize),
                ),
              ),
              MonthGrid(cal)
            ],
          ),
        )
      ],
    );
  }
}
