import 'dart:io';

List<int> getDivisors(int n) {
  List<int> divisors = [];
  for (int i = 1; n >= i * i; i++) {
    if (n % i == 0) {
      divisors.add(i);
      if (i != n ~/ i) {
        divisors.add(n ~/ i);
      }
    }
  }
  divisors.sort();
  return divisors;
}

void main(List<String> args) {
  stdout.write("Enter a number: ");
  int? n = int.parse(stdin.readLineSync()!);

  print(getDivisors(n));
}
