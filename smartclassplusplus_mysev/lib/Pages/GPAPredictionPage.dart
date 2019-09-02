import 'package:flutter/material.dart';
import '../Utils/GradeCalc.dart';

class GPAPredictionPage extends StatefulWidget {
  @override
  _GPAPredictionPageState createState() => _GPAPredictionPageState();
}

class _GPAPredictionPageState extends State<GPAPredictionPage> {
  final gpaCont = new TextEditingController();
  final gpaCont2 = new TextEditingController();
  final gpaCont3 = new TextEditingController();

  final _gpa = new GPA();
  String _temp = "";

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
        child: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: gpaCont,
                onEditingComplete: (){
                  _temp = gpaCont.text;
                },
                decoration: InputDecoration(
                  hintText: "Grade 1",
                ),
              ),
              TextFormField(
                controller: gpaCont,
                onEditingComplete: (){
                  _temp = gpaCont2.text;
                },
                decoration: InputDecoration(
                  hintText: "Grade 2",
                ),
              ),
              Text(_gpa.getPredictedGrade().toString()),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _gpa.gradePrediction(gpaCont.text, gpaCont2.text, gpaCont3.text);
                  });
                },
              ),
              TextFormField(
                controller: gpaCont3,
                onEditingComplete: (){
                  _temp = gpaCont.text;
                },
                decoration: InputDecoration(
                  hintText: "Wanted Grade",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
