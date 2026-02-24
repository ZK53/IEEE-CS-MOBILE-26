import 'package:question3/models/student.dart';
import 'package:question3/models/student_event.dart';

class PostgraduateStudent extends Student implements StudentEvent {
  PostgraduateStudent({required super.id, required super.name});

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
    if (mark >= 90) return 12;
    if (mark >= 85) return 32 / 3;
    if (mark >= 80) return 31 / 3;
    if (mark >= 75) return 10;
    if (mark >= 70) return 22 / 3;
    if (mark >= 65) return 7;
    if (mark >= 60) return 6;
    return 0;
  }
}
