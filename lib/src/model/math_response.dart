class MathResponse {
  final int _answer;
  late final int _elapsedTime;
  late final MathResponseType _type;

  MathResponse.fromDart(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = start.difference(end).inMilliseconds;
    _type = MathResponseType.dart;
  }

  MathResponse.fromFpc(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = start.difference(end).inMilliseconds;
    _type = MathResponseType.fpc;
  }

  MathResponse.fromFfi(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = start.difference(end).inMilliseconds;
    _type = MathResponseType.ffi;
  }

  int get elapsedMilliseconds => _elapsedTime;

  int get answer => _answer;

  String get duration => "Using '${_type.name}' it took ${_elapsedTime.toStringAsFixed(2)}ms to execute";
}

enum MathResponseType {
  dart("Dart only"),
  fpc("Flutter Platform Channels"),
  ffi("Foreign Function Interface");

  final String name;
  const MathResponseType(this.name);
}