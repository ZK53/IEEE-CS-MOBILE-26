import 'package:question3/models/full_name.dart';
import 'package:question3/models/postgraduate_student.dart';
import 'package:question3/models/undergraduate_student.dart';

void main(List<String> args) {
  UndergraduateStudent us = UndergraduateStudent(
    id: "123",
    name: FullName(
      firstName: "Mohamed",
      middlName: "Ahmed",
      surname: "Zakaria",
    ),
  );

  PostgraduateStudent ps = PostgraduateStudent(
    id: "321",
    name: FullName(firstName: "Mohamed", middlName: "Ahmed", surname: "Nour"),
  );

  us.setMarks = [94, 82, 90, 74, 67];
  ps.setMarks = [63, 85, 90, 74, 80];

  us.printInfo();
  ps.printInfo();
}
