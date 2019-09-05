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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                gradeInputBox(context, gpaCont, "Grade 1"),
                gradeInputBox(context, gpaCont2, "Grade 2"),
                gradeInputBox(context, gpaCont3, "Wanted Grade"),
              ],
            ),
          ),
          //gradeInputBox(context, gpaCont, "Grade 1"),
          //gradeInputBox(context, gpaCont2, "Grade 2"),
          Text(
            _temp == ""
                ? (_temp == "Error"
                    ? _temp
                    : _temp == "0.0"
                        ? /*_temp*/ ""
                        : ("Min Grade needed:" +
                            _gpa.getPredictedGrade().toString()))
                : _temp,
            style: Theme.of(context).textTheme.body2,
          ),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.transparent,
            onPressed: () {
              setState(() {
                _gpa.gradePrediction(
                    gpaCont.text, gpaCont2.text, gpaCont3.text);
                print("Predicted Grade: ${_gpa.getPredictedGrade()}");
                _temp = _gpa.getPredictedGrade().toString();
                if (_gpa.error != null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: Theme.of(context).accentColor,
                    content: Text(_gpa.error),
                  ));
                  _temp = "Error";
                  _gpa.error = null;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Theme.of(context).primaryColor,
                      Theme.of(context).secondaryHeaderColor,
                      Theme.of(context).primaryColor,
                    ],
                    stops: <double>[
                      0.0,
                      0.5,
                      1.0,
                    ],
                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Calculate",
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
          //gradeInputBox(context, gpaCont3, "Wanted Grade"),
        ],
      ),
    );
  }
}

Widget gradeInputBox(
    BuildContext context, TextEditingController controller, String hintText) {
  return Container(
    padding: EdgeInsets.all(5),
    child: TextFormField(
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      controller: controller,
      inputFormatters: [
        BlacklistingTextInputFormatter(RegExp("[a-z]")),
        BlacklistingTextInputFormatter(RegExp("[A-Z]")),
      ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.body2,
        hasFloatingPlaceholder: true,
      ),
      style: Theme.of(context).textTheme.body2,
    ),
  );
}
