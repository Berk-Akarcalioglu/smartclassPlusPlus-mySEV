
import 'package:smartclassplusplus_mysev/Resources/Classes.dart';

class GPA {
  
  List<double> credits = [5, 1, 5, 5];
  List<double> grades = [4, 3, 2, 0];

  double _predictedGrade = 0.0;
  String error;

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

  void gradePrediction(String input1, String input2, String wanted) async{

    double firstgrade = input1 == "" ? 0.0 : double.parse(input1);
    double secondgrade = input2 == "" ? 0.0 : double.parse(input2);
    double wantedgrade = wanted == "" ? 0.0 : double.parse(wanted);

    _predictedGrade = 3*(wantedgrade)- (firstgrade+secondgrade);
  try{

    if ((input1.isEmpty) || (input2.isEmpty) || (wanted.isEmpty)) {
      throw Exception(["Please fill in all of the inputs."]);
    }else if((firstgrade > 100) || (secondgrade > 100) || (wantedgrade > 100)){
      _predictedGrade = 0.0;
      throw Exception(["You cannot enter a grade bigger than a hundred."]);
    }else if((_predictedGrade > 100) || (_predictedGrade < 0)) {
      _predictedGrade = 0.0;
      throw Exception(["Sorry, that is impossible"]);
    }else if(_predictedGrade == 0) {
      throw Exception(["Keep it up"]);
    }else {
      _predictedGrade = (3*wantedgrade)- (firstgrade+secondgrade);
    }
    
  }catch (e){
    error = e.toString();
    print(e);
  }
  }

  double getPredictedGrade() {
    return _predictedGrade;
  }

}



final GPA gpa = GPA();

