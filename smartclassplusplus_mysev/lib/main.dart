import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Class Plus Plus',
      darkTheme: ThemeData(
        backgroundColor: Colors.black45,
        appBarTheme: AppBarTheme(
          color: Colors.black38,
          elevation: 10,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
      ),
      theme: ThemeData(
        backgroundColor: Colors.black12,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          elevation: 1,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black,
          ),
          body2: TextStyle(
            color: Colors.white,
          ),
        ),    
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
