import 'package:question3/models/full_name.dart';

abstract class Student {
  final String _id;
  final FullName _fullName;
  List<double> _marks = [];

  Student({required String id, required FullName name})
    : _id = id,
      _fullName = name;

  String get id => _id;
  FullName get fullName => _fullName;
  List<double> get marks => _marks;

  set setMarks(List<double> marks) => _marks = marks;
}
