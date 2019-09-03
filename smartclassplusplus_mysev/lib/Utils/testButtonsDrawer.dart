import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartclassplusplus_mysev/Utils/Buttons/DrawerButton.dart';

Widget testbuttonsdrawer(BuildContext context) {
  List<Widget> _list = new List();
  for (var i = 0; i < 10; i++) {
    _list.add(drawerButton(
        context,
        "${i}",
        Theme.of(context).textTheme.body2,
        Icons.search,
        Theme.of(context).accentColor,
        Theme.of(context).textTheme.body2.color,
        () {}));
  }

  return ListBody(
    children: _list,
  );
}
