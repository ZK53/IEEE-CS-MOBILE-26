void main(List<String> args) {
  String s1 = "Hello", s2 = "World";
  String conc = s1 + " " + s2;
  print("Concatenated: ${conc}");
  print("Length: ${conc.length}");
  print("Substring: ${conc.substring(0, 7)}");
  print("Uppercase: ${conc.toUpperCase()}");
  print("Lowercase: ${conc.toLowerCase()}");
}
