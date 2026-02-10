import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter anything to check if palindrome: ");
  String? input = stdin.readLineSync();

  if (isPalindrome(input!)) {
    print("${input} is palindrome");
  } else {
    print("${input} is not palindrome");
  }
}

bool isPalindrome(String s) {
  String reversed = s.split("").reversed.join("");
  return s == reversed;
}
