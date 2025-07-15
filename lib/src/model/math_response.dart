import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';

class MathResponse {
  late final int _answer;
  late final int _elapsedTime;
  late final MathConnectionType _type;

  MathResponse.fromDart(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = start.difference(end).inMilliseconds;
    _type = MathConnectionType.dart;
  }

  MathResponse.fromFpc(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = end.difference(start).inMilliseconds;
    _type = MathConnectionType.fpc;
  }

  MathResponse.fromFfi(this._answer, {required DateTime start, required DateTime end}) {
    _elapsedTime = start.difference(end).inMilliseconds;
    _type = MathConnectionType.ffi;
  }

  int get elapsedMilliseconds => _elapsedTime;

  int get answer => _answer;

  String get duration => "Using '${_type.name}' approach\nit took ${_elapsedTime.toStringAsFixed(2)}ms to execute";
}