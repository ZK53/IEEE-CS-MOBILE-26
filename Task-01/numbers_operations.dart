import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter a number: ");
  String? input = stdin.readLineSync();
  double nDouble = double.parse(input!);
  int nInt = nDouble.toInt();
  print("Integer: ${nInt}");
  print("Double: ${nDouble}");
}
