import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: gpaCont,
            inputFormatters: [
              BlacklistingTextInputFormatter(RegExp("[a-z]")),
              BlacklistingTextInputFormatter(RegExp("[A-Z]")),
              
            ],
            decoration: InputDecoration(
              hintText: "Grade 1",
            ),
          ),
          TextFormField(
            controller: gpaCont2,
            inputFormatters: [
              BlacklistingTextInputFormatter(RegExp("[a-z]")),
              BlacklistingTextInputFormatter(RegExp("[A-Z]")),
            ],
            decoration: InputDecoration(
              hintText: "Grade 2",
            ),
          ),
          Text(_temp == ""
              ? (_temp == "Error"
                  ? _temp
                  : _temp == "0.0"
                      ? /*_temp*/ ""
                      : ("Min Grade needed:" +
                          _gpa.getPredictedGrade().toString()))
              : _temp),
          RaisedButton(
            onPressed: () {
              setState(() {
                _gpa.gradePrediction(
                    gpaCont.text, gpaCont2.text, gpaCont3.text);
                print("Predicted Grade: ${_gpa.getPredictedGrade()}");
                _temp = _gpa.getPredictedGrade().toString();
                if (_gpa.error != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                    backgroundColor: Theme.of(context).accentColor,
                    content: Text(_gpa.error),
                  ));
                  _temp = "Error";
                  _gpa.error = null;
                }
              });
            },
          ),
          TextFormField(
            controller: gpaCont3,
            inputFormatters: [
              BlacklistingTextInputFormatter(RegExp("[a-z]")),
              BlacklistingTextInputFormatter(RegExp("[A-Z]")),
            ],
            decoration: InputDecoration(
              hintText: "Wanted Grade",
            ),
          ),
        ],
      ),
    );
  }
}
