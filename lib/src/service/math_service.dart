import 'package:flutter/services.dart';
import 'package:flutter_cpp_ai/src/bindings/math_bindings.dart';
import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';
import 'package:flutter_cpp_ai/src/model/math_request.dart';
import 'package:flutter_cpp_ai/src/model/math_response.dart';

class MathService {
  static const platform = MethodChannel("com.samir_ribeiro.flutter_cpp_ai");

  final MathConnectionType _type;

  MathService(this._type);

  Future<MathResponse> add(MathRequest request) {
    switch (_type) {
      case MathConnectionType.dart:
        return Future.value(_sumDartOnly(request));
      case MathConnectionType.fpc:
        return _sumFpc(request);
      case MathConnectionType.ffi:
        return Future.value(_sumFfi(request));
    }
  }

  MathResponse _sumDartOnly(MathRequest request) {
    final start = DateTime.now();
    final result = request.x + request.y;
    final end = DateTime.now();

    return MathResponse.fromDart(result, start: start, end: end);
  }

  Future<MathResponse> _sumFpc(MathRequest request) async {
    try {
      final start = DateTime.now();
      final int result = await platform.invokeMethod("add", {
        "x": request.x,
        "y": request.y,
      });
      final end = DateTime.now();

      return MathResponse.fromFpc(result, start: start, end: end);
    } on PlatformException catch (e) {
      print("Error executing FPC: ${e.message}");
      return Future.error(e);
    }
  }

  MathResponse _sumFfi(MathRequest request) {
    try {
      final start = DateTime.now();
      final int result = MathBindings.instance.addNumbers(request.x, request.y);
      final end = DateTime.now();

      return MathResponse.fromFpc(result, start: start, end: end);
    } on PlatformException catch (e) {
      print("Error executing FFI: ${e.message}");
      rethrow;
    }
  }
}
