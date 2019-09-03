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
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: userNameCont,
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: Theme.of(context).textTheme.body2,
              labelStyle: Theme.of(context).textTheme.body2,
            ),
          ),
          TextFormField(
            controller: passwordCont,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: Theme.of(context).textTheme.body2,
            ),
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              authServices.login();
              Navigator.pushAndRemoveUntil(
                  context,
                  new MaterialPageRoute(builder: (context) => MainPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
