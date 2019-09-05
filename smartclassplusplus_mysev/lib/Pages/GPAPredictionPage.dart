import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/GPAPredictor.dart';

class GPAPredictionPage extends StatefulWidget {
  @override
  _GPAPredictionPageState createState() => _GPAPredictionPageState();
}

class _GPAPredictionPageState extends State<GPAPredictionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text("Grade Predictor"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor,
              ])),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).primaryColor,
            ],
            stops: <double>[0.4, 1.0],
          )),
          alignment: Alignment.center,
          child: GPAPredictor()),
    );
  }
}
