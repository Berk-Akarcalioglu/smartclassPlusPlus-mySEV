import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<double> gradeslist = [60, 66.0, 76.0, 86.0, 88.0, 100.0, ];

class Classes {
  var lessons = new Map();

  Classes() {
    lessons.addAll({'tr': Lesson("Turkish", 3)});
    lessons.addAll({'math': Lesson("Mathematics", 2)});
    lessons['tr'].addExam(gradeslist[0], "exam 1");
    lessons['tr'].addExam(gradeslist[1], "ecam 2");
    lessons['tr'].addExam(gradeslist[2], "name");
    lessons['math'].addExam(gradeslist[3], "exam 1a");
    lessons['math'].addExam(gradeslist[4], "ecam 2b");
    lessons['math'].addExam(gradeslist[5], "name4");
  }
}

class Lesson {
  Lesson(this.name, this.credit);

  String name;
  List<Exam> exams = new List();
  double credit;
  double grade = 0;
  int examCount = 0;

  void addExam(double examGrade, String examName){
    exams.add(Exam(examGrade, examName));
    examCount++;
    grade += examGrade;
  }

  double getGrade() {
    double temp = 0;
    for (var i = 0; i < exams.length; i++) {
      temp += exams[i].grade;
    }
    return temp / exams.length;
  }

  int getNumOfExams() {
    return exams.length;
  }

  
  

}

class Exam {
  Exam(this.grade, this.name);
  double grade;
  String name;
}

Widget examList(BuildContext context, Lesson lesson) {

  List<Widget> lessons = new List();

  for (var exam in lesson.exams) {
    lessons.add(
      Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: gradeColor(convertToUSGrade(exam.grade)),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: gradeColor(convertToUSGrade(exam.grade)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4 *3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Lesson: ${lesson.name}",
                      style: Theme.of(context).textTheme.body2,

                    ),
                    Text(
                      "Exam Name: ${exam.name}",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      "Grade: ${exam.grade}",
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
      ));
  }

  return ListBody(
    children: lessons,
  );

}

Color gradeColor(double grade) {
  if (grade == 4.0) {
    return Colors.greenAccent;
  }else if (grade == 3.7) {
    return Colors.green;
  }else if (grade == 3.3) {
    return Colors.green[300];
  }else if (grade == 3.0) {
    return Colors.yellow[600];
  }else if (grade == 2.7) {
    return Colors.orange[400];
  }else if (grade == 2.3) {
    return Colors.orange;
  }else if (grade == 2.0) {
    return Colors.orange[700];
  }else if (grade == 1.7) {
    return Colors.orange[900];
  }else if (grade == 1.3) {
    return Colors.red;
  }else if (grade == 1.0) {
    return Colors.red;
  }else if (grade == 0.7) {
    return Colors.red[700];
  }else {
    return Colors.red[900];
  }
}

double convertToUSGrade(double grade) {
    if (grade <= 100 && grade >= 93) {
      return 4.0;
    }else if (grade <= 92 && grade >= 90) {
      return 3.7;
    }else if (grade <= 89 && grade >= 87) {
      return 3.3;
    }else if (grade <= 86 && grade >= 83) {
      return 3.0;
    }else if (grade <= 82 && grade >= 80) {
      return 2.3;
    }else if (grade <= 79 && grade >= 77) {
      return 2.0;
    }else if (grade <= 76 && grade >= 73) {
      return 2.0;
    }else if (grade <= 72 && grade >= 70) {
      return 1.7;
    }else if (grade <= 69 && grade >= 67) {
      return 1.3;
    }else if (grade <= 66 && grade >= 63) {
      return 1.0;
    }else if (grade <= 62 && grade >= 60) {
      return 0.7;
    }else {
      return 0;
    }
  }