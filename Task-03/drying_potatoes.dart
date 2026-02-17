// p0 => water percentage before
// 20 => total weight
// p1 => water percentage after

int potatoes(int p0, int w0, int p1) {
  return (w0 * (100 - p0)) ~/ (100 - p1);
}

void main(List<String> args) {
  print(potatoes(96, 57, 94));
}
