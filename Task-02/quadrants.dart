import 'dart:io';

void main(List<String> args) {
  List<int> xy = stdin.readLineSync()!.split(" ").map(int.parse).toList();
  int x = xy[0], y = xy[1];
  if (x > 0 && y > 0) {
    // first
    print(1);
  } else if (x < 0 && y > 0) {
    // second
    print(2);
  } else if (x < 0 && y < 0) {
    // third
    print(3);
  } else if (x > 0 && y < 0) {
    // fourth
    print(4);
  }
}
