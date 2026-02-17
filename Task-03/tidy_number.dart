bool tidyNumber(int n) {
  String s = n.toString();
  for (int i = 0; i < s.length - 1; i++) {
    if (s[i].compareTo(s[i + 1]) > 0) {
      return false;
    }
  }
  return true;
}

void main(List<String> args) {
  print(tidyNumber(12));
  print(tidyNumber(32));
  print(tidyNumber(1024));
  print(tidyNumber(13579));
  print(tidyNumber(2335));
}
