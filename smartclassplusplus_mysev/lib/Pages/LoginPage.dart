import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Auth/auth.dart';
import 'package:smartclassplusplus_mysev/Pages/MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameCont = new TextEditingController();
  final passwordCont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).secondaryHeaderColor,
          ],
          stops: [0.3, 1.0],
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "lib/images/aciPanther.png",
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).secondaryHeaderColor,
                      Theme.of(context).primaryColor,
                    ],
                    stops: [0.3, 1.0],
                  ),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: userNameCont,
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: Theme.of(context).textTheme.body2,
                  ),
                  cursorColor: Colors.white30,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).secondaryHeaderColor,
                    ],
                    stops: [0.3, 1.0],
                  ),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: passwordCont,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.body2,
                  ),
                  cursorColor: Colors.white30,
                  obscureText: true,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor,
                  ],
                  stops: [0.3, 1.0],
                ),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                color: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  //authServices.login();
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(builder: (context) => MainPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.body2.color,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor,
                  ],
                  stops: [0.3, 1.0],
                ),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                color: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  authService.googleSignIn();
                  //authServices.login();
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(builder: (context) => MainPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Login With Google",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.body2.color,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
