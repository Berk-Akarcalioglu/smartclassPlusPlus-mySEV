import 'package:flutter/material.dart';

Widget drawerButton(BuildContext context, String text, TextStyle style, IconData icon, Color iconColor, Function function) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: <Color>[
            Theme.of(context).secondaryHeaderColor,
            Theme.of(context).primaryColor
          ],
          ),
      ),
      child: FlatButton(
        //height: 20,
        color: Colors.transparent,
        splashColor: Theme.of(context).accentColor,
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
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    ),
  );
}
