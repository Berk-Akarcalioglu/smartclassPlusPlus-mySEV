
class GPA {
  
  List<double> credits = [5, 1, 5, 5];
  List<double> grades = [4, 3, 2, 0];

  double gpa(double totalCredits, double totalGrade) {
    return totalGrade /totalCredits;
  }

  double getTotalGrade() {

    double total = 0;

    for (var i = 0; i < (grades.length + credits.length) / 2; i++) {
      total += credits[i] * grades[i];
    }

    return total;
  }

  double getTotalCredit() {
    

    double total = 0;

    for (var credit in credits) {
      total += credit;
    }

    return total;
  }

}

final GPA gpa = GPA();