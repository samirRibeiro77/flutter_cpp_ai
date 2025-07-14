import 'package:flutter/cupertino.dart';
import 'package:flutter_cpp_ai/src/model/math_request.dart';
import 'package:flutter_cpp_ai/src/model/math_response.dart';

class MathService {
  MathService();

  MathResponse sumDartOnly(MathRequest request) {
    final start = DateTime.now();
    final result = request.x + request.y;
    final end = DateTime.now();

    return MathResponse.fromDart(result, start: start, end: end);
  }
}