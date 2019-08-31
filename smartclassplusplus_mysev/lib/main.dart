import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Class Plus Plus',
      home: MainPage(),
    );
  }
}
