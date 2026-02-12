import 'dart:io';

void main(List<String> args) {
  List<int> a = stdin.readLineSync()!.split(" ").map(int.parse).toList();
  int sum = 0;
  for (int i = 0; i < a.length; i++) {
    sum += a[i] * a[i];
  }
  print(sum);
}
