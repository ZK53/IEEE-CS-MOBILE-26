import 'dart:io';

void main(List<String> args) {
  String? input = stdin.readLineSync();
  int l = input!.length;
  if (l % 2 == 0) {
    print(input[l ~/ 2 - 1] + input[l ~/ 2]);
  } else {
    print(input[l ~/ 2]);
  }
}
