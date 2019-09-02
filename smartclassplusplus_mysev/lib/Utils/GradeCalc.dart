
import 'package:smartclassplusplus_mysev/Resources/Classes.dart';

class GPA {
  
  List<double> credits = [5, 1, 5, 5];
  List<double> grades = [4, 3, 2, 0];

  double _predictedGrade = 0.0;

  double gpa(double totalCredits, double totalGrade) {
    return totalGrade /totalCredits;
  }

  double getTotalGrade(Map lessons) {

    double total = 0;

    for (var lesson in lessons.values) {
      Lesson temp = lesson;

      total += convertToUSGrade(temp.getGrade()) * temp.credit;
      print("${temp.name}'s grade is: ${convertToUSGrade(temp.getGrade())}");
    }

    print("Total grade: ${total}");

    return total;
  }

  double getTotalCredit(Map lessons) {
    

    double total = 0;

    for (var lesson in lessons.values) {
      Lesson temp = lesson; 

      total += temp.credit;
      print("${temp.name}'s credit is: ${temp.credit}");
    }

    print("Total credits: ${total}");

    return total;
  }

  void gradePrediction(String input1, String input2, String wanted) {

    double predictionInput1 = input1 == "" ? 0.0 : double.parse(input1);
    double predictionInput2 = input2 == "" ? 0.0 : double.parse(input2);
    double predictionInputWanted = wanted == "" ? 0.0 : double.parse(wanted);

    _predictedGrade = 0.0;
  }

  double getPredictedGrade() {
    return _predictedGrade;
  }

}

final GPA gpa = GPA();