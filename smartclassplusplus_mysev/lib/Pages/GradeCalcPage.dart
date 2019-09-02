import 'package:flutter/material.dart';
import 'package:smartclassplusplus_mysev/Pages/GPAPredictor.dart';
import 'package:smartclassplusplus_mysev/Resources/Classes.dart';
import '../Utils/GradeCalc.dart';

class GradeCalcPage extends StatefulWidget {
  @override
  _GradeCalcPageState createState() => _GradeCalcPageState();
}

class _GradeCalcPageState extends State<GradeCalcPage> {
  Classes yearClass = new Classes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text("Grade Calculator"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: GPAPredictor()
                          ),
                      ),
                    );
                  });
            },
            icon: Icon(Icons.note_add),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: ListView(
          children: <Widget>[
            examList(context, yearClass.lessons['tr']),
            examList(context, yearClass.lessons['math']),
            Container(
              alignment: Alignment.center,
              child: Text(
                  "gpa : ${gpa.gpa(gpa.getTotalCredit(yearClass.lessons), gpa.getTotalGrade(yearClass.lessons)).floorToDouble()}"),
            ),
          ],
        ),
      ),
    );
  }
}
