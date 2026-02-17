int dbl_linear(int n) {
  List<int> u = [1];
  int i = 0;
  int j = 0;
  while (u.length <= n) {
    int y = 2 * u[i] + 1;
    int z = 3 * u[j] + 1;
    int next = y < z ? y : z;
    u.add(next);

    if (next == y) i++;
    if (next == z) j++;
  }
  return u[n];
}

void main(List<String> args) {
  print(dbl_linear(10));
}
