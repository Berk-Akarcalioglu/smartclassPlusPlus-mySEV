import 'package:flutter/material.dart';

Widget drawerButton(BuildContext context, String text, IconData icon, Color bgColor, Color iconColor, Function function) {
  return MaterialButton(
    height: 20,
    color: bgColor,
    splashColor: Color.fromRGBO(255, 255, 255, 1),
    onPressed: function,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
        ),
        Text(text),
      ],
    ),
  );
}
