import 'dart:io';

void main() {
  stdout.write("Enter the temp in celsius: ");
  String? input = stdin.readLineSync();
  int? tempC = int.tryParse(input!);
  if (tempC == null) {
    print("Enter a valid value");
  } else {
    double tempF = tempC * 9 / 5 + 32;
    print("${tempC} C = ${tempF.ceil()} F");
  }
}
