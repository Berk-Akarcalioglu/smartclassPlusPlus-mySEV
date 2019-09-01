
import 'package:smartclassplusplus_mysev/Resources/Classes.dart';

class GPA {
  
  List<double> credits = [5, 1, 5, 5];
  List<double> grades = [4, 3, 2, 0];

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

}

final GPA gpa = GPA();