import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Auth/auth.dart';
import 'package:smartclassplusplus_mysev/Pages/LoginPage.dart';
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
        backgroundColor: Color(0xfdf0f6),
        accentColor: Color.fromRGBO(186, 26, 106, 1)/*.fromRGBO(149, 21, 85, 1)*/,
        primaryColor: Color.fromRGBO(149, 21, 85, 1)/*.fromRGBO(119, 17, 68, 1)*/,
        secondaryHeaderColor: Color.fromRGBO(181, 37, 26, 1)/*.fromRGBO(145, 30, 21, 1)*/,
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(119, 17, 68, 1),
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
        splashColor: Colors.transparent,  
      ),
      home: authServices.userID == null ? LoginPage() : MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
