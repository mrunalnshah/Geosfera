import 'package:flutter/material.dart';

class GeoDashButton extends StatelessWidget {
  void Function() onPress;
  Widget child;
  GeoDashButton({super.key, required this.onPress, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 2.0),
      height: 50.0,
      width: double.infinity,
      child: MaterialButton(
        color: Color(0xFF62A696),
        onPressed: onPress,
        child: child,
      ),
    );
  }
}
