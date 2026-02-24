class FullName {
  String _firstName;
  String _middleName;
  String _surname;

  FullName({
    required String firstName,
    required String middlName,
    required String surname,
  }) : _firstName = firstName,
       _middleName = middlName,
       _surname = surname;

  set setFirstName(String first) {
    _firstName = first;
  }

  set setMiddleName(String middle) {
    _middleName = middle;
  }

  set setSurname(String surname) {
    _surname = surname;
  }

  String get firstName => _firstName;
  String get middleName => _middleName;
  String get surname => _surname;

  @override
  String toString() {
    return "Full Name: $firstName $middleName $surname";
  }
}
