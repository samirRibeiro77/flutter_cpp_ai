class MathRequest {
  late int x;
  late int y;

  MathRequest(this.x, this.y);

  MathRequest.fromString(String x, String y) {
    this.x = int.parse(x);
    this.y = int.parse(y);
  }
}