import 'package:flutter/material.dart';
import 'package:geosfera/screens/select_your_game.dart';
import 'package:geosfera/utility/button/geo_dash_button.dart';

TextStyle textStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset("data/logo/geosfera_logo_bgx.png"),
          ),
          Expanded(
            child: Column(
              children: [
                GeoDashButton(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SelectYourGame();
                        },
                      ),
                    );
                  },
                  child: Text('Play', style: textStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
