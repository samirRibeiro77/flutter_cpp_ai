import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';
import 'package:flutter_cpp_ai/src/model/math_request.dart';
import 'package:flutter_cpp_ai/src/model/math_response.dart';

class MathService {
  final MathConnectionType _type;
  MathService(this._type);

  MathResponse add(MathRequest request) {
    switch (_type) {
      case MathConnectionType.dart:
        return _sumDartOnly(request);
      default:
        return _sumDartOnly(request); //Remove later
    }
  }

  MathResponse _sumDartOnly(MathRequest request) {
    final start = DateTime.now();
    final result = request.x + request.y;
    final end = DateTime.now();

    return MathResponse.fromDart(result, start: start, end: end);
  }
}