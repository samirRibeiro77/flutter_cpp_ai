enum MathConnectionType {
  dart("Dart only"),
  fpc("Flutter Platform Channels"),
  ffi("Foreign Function Interface");

  final String name;
  const MathConnectionType(this.name);
}