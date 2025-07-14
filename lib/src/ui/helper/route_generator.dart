import 'package:flutter/material.dart';
import 'package:flutter_cpp_ai/src/ui/screen/home_page.dart';

class RouteGenerator {
  static const String home = "/";
  static const String flutterOnly = "/dart";
  static const String platformChannels = "/fcp";
  static const String foreignFunctionInterface = "/ffi";

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      // case flutterOnly:
      //   return MaterialPageRoute(builder: (_) => MaterialApp());
      // case platformChannels:
      //   return MaterialPageRoute(builder: (_) => MaterialApp());
      // case foreignFunctionInterface:
      //   return MaterialPageRoute(builder: (_) => MaterialApp());
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
