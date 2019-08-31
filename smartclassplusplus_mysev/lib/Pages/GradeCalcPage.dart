import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Utils/GradeCalc.dart';

class GradeCalcPage extends StatefulWidget {
  @override
  _GradeCalcPageState createState() => _GradeCalcPageState();
}

class _GradeCalcPageState extends State<GradeCalcPage> {
  List<PieChartSectionData> sections = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text("Grade Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("gpa : ${gpa.gpa(gpa.getTotalCredit(), gpa.getTotalGrade())}"),
          ),
        ],
      ),
    );
  }
}
