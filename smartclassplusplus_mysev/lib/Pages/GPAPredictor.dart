import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Utils/GradeCalc.dart';

class GPAPredictor extends StatefulWidget {
  @override
  _GPAPredictorState createState() => _GPAPredictorState();
}

class _GPAPredictorState extends State<GPAPredictor> {
  final gpaCont = new TextEditingController();
  final gpaCont2 = new TextEditingController();
  final gpaCont3 = new TextEditingController();

  final _gpa = new GPA();
  String _temp = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: gpaCont,
            decoration: InputDecoration(
              hintText: "Grade 1",
            ),
          ),
          TextFormField(
            controller: gpaCont2,
            decoration: InputDecoration(
              hintText: "Grade 2",
            ),
          ),
          Text(_temp == "" ? _gpa.getPredictedGrade().toString() : _temp),
          RaisedButton(
            onPressed: () {
              setState(() {
                _gpa.gradePrediction(gpaCont.text, gpaCont2.text, gpaCont3.text);
                print(_gpa.getPredictedGrade());
                _temp = _gpa.getPredictedGrade().toString();
              });
            },
          ),
          TextFormField(
            controller: gpaCont3,
            decoration: InputDecoration(
              hintText: "Wanted Grade",
            ),
          ),
        ],
      ),
    );
  }
}
