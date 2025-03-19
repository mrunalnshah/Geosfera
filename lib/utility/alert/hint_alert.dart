import 'package:flutter/material.dart';

void hintDialogBox(BuildContext context, Widget childContent) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('Hint', style: TextStyle(color: Color(0xFF00441b))),
        content: childContent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close', style: TextStyle(color: Color(0xFF62A696))),
          ),
        ],
      );
    },
  );
}
