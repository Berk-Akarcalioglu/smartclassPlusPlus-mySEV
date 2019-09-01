import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
              child: Text("gpa : ${gpa.gpa(gpa.getTotalCredit(yearClass.lessons), gpa.getTotalGrade(yearClass.lessons))}"),
            ),
          ],
        ),
      ),
    );
  }
}

