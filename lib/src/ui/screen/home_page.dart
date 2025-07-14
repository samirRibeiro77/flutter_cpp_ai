import 'package:flutter/material.dart';
import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';
import 'package:flutter_cpp_ai/src/ui/helper/route_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _goToPage(MathConnectionType type) {
    String routeName = "";

    switch (type) {
      case MathConnectionType.dart:
        routeName = RouteGenerator.flutterOnly;
        break;
      case MathConnectionType.fpc:
        routeName = RouteGenerator.platformChannels;
        break;
      case MathConnectionType.ffi:
        routeName = RouteGenerator.foreignFunctionInterface;
    }

    Navigator.pushNamed(context, routeName);
  }

  List<Widget> _buildButtonList() {
    List<Widget> buttonList = [];

    for (var type in MathConnectionType.values) {
      buttonList.add(
        ElevatedButton(
          onPressed: () => _goToPage(type),
          child: Text(type.name),
        ),
      );
      buttonList.add(const SizedBox(height: 16));
    }

    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI  &  Flutter  &  C++"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Simple Math Sum with different providers",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 48),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildButtonList(),
            ),
          ],
        ),
      ),
    );
  }
}
