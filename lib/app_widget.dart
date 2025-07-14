import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_cpp_ai/src/ui/helper/app_theme.dart';
import 'package:flutter_cpp_ai/src/ui/helper/route_generator.dart';
import 'package:flutter_cpp_ai/src/ui/screen/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AI Flutter C++",
      debugShowCheckedModeBanner: false,
      theme: Platform.isIOS ? MyAppTheme.iosTheme : MyAppTheme.androidTheme,
      initialRoute: RouteGenerator.home,
      onGenerateRoute: RouteGenerator.generateRoutes,
      home: HomePage(),
    );
  }
}