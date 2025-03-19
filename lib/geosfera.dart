import 'package:flutter/material.dart';
import 'package:geosfera/screens/dashboard.dart';
import 'package:geosfera/theme/cool_green_earth.dart';

void main() {
  runApp(Geosfera());
}

class Geosfera extends StatelessWidget {
  const Geosfera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: coolGreenEarth, home: Dashboard());
  }
}

// #62A696 COLOR LOGO
// #00441b Text TITLE
// #f7fcf5 Background
// #FFFFFF Text
