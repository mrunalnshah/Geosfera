import 'package:flutter/material.dart';

TextStyle textStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: Color(0xFFFFFFFF),
);

class OptionButton extends StatelessWidget {
  void Function() onPress;
  String text;
  OptionButton({super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: MaterialButton(
        color: Color(0xFF62A696),
        onPressed: onPress,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text,
            softWrap: true,
            maxLines: 3,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
