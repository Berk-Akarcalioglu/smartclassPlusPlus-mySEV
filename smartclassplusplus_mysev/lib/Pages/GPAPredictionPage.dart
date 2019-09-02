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
      ),
        body: Container(
          alignment: Alignment.center,
          child: GPAPredictor()
          ),
    );
  }
}
