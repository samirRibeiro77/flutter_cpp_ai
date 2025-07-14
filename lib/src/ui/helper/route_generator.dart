import 'package:flutter/material.dart';
import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';
import 'package:flutter_cpp_ai/src/ui/screen/home_page.dart';
import 'package:flutter_cpp_ai/src/ui/screen/math_page.dart';

class RouteGenerator {
  static const String home = "/";
  static const String flutterOnly = "/dart";
  static const String platformChannels = "/fcp";
  static const String foreignFunctionInterface = "/ffi";

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case flutterOnly:
        return MaterialPageRoute(builder: (_) => MathPage(type: MathConnectionType.dart));
      case platformChannels:
        return MaterialPageRoute(builder: (_) => MathPage(type: MathConnectionType.fpc));
      case foreignFunctionInterface:
        return MaterialPageRoute(builder: (_) => MathPage(type: MathConnectionType.ffi));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("Error 404")),
          body: Center(
            child: Text("Page not found", style: TextStyle(fontSize: 32)),
          ),
        );
      },
    );
  }
}
