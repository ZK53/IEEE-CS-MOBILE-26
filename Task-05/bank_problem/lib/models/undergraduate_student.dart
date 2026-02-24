import 'package:question3/models/student.dart';
import 'package:question3/models/student_event.dart';

class UndergraduateStudent extends Student implements StudentEvent {
  UndergraduateStudent({required super.id, required super.name});

  @override
  double calcGPA() {
    if (marks.isEmpty) return 0;
    double points = 0;
    for (double mark in marks) {
      points += _calcPoints(mark);
    }
    return points / marks.length * 3;
  }

  @override
  void printInfo() {
    print("""
ID: $id
Full Name: $fullName
Marks: $marks
GPA: ${calcGPA().toStringAsFixed(2)}
""");
  }

  double _calcPoints(double mark) {
    if (mark >= 95) return 12;
    if (mark >= 90) return 11.5;
    if (mark >= 85) return 11;
    if (mark >= 80) return 10;
    if (mark >= 75) return 9;
    if (mark >= 70) return 8;
    if (mark >= 65) return 7;
    if (mark >= 60) return 6;
    if (mark >= 56) return 5;
    if (mark >= 53) return 4;
    if (mark >= 50) return 3;
    return 0;
  }
}
