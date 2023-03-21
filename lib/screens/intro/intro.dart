import 'package:flutter/cupertino.dart';
import 'package:steadycalendar/components/sc_flat_button.dart';

import '../login_options/login_options.dart';

class Intro extends StatelessWidget {
  static const routeName = '/intro';

  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            5,
            (index) => Image.asset(
                  'assets/images/iphone-valprop-$index@3x.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )),
      ),
      Positioned(
        width: MediaQuery.of(context).size.width,
        height: 60,
        bottom: 50,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SCFlatButton(Text("Get Started"),
                onTap: () =>
                    Navigator.pushNamed(context, LoginOptions.routeName))),
      )
    ]);
  }
}
