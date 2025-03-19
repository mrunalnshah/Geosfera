import 'package:flutter/material.dart';

TextStyle textStyle = TextStyle(
  color: Color(0xFF62A696),
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

class SubmitButton extends StatelessWidget {
  void Function() onPress;
  SubmitButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        border: Border.all(color: Color(0xFF62A696), width: 3.0),
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPress,
        child: Text('Submit', style: textStyle),
      ),
    );
  }
}
