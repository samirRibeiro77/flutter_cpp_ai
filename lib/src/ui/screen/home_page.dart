import 'package:flutter/material.dart';
import 'package:flutter_cpp_ai/src/ui/helper/route_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _goToPage(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI  &  Flutter  &  C++")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Simple Math Sum with different providers",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => _goToPage(RouteGenerator.flutterOnly),
              child: const Text("Use Dart only"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  _goToPage(RouteGenerator.foreignFunctionInterface),
              child: const Text("Use C++ Foreign Function Interface"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _goToPage(RouteGenerator.platformChannels),
              child: const Text("Use C++ Platform Channel"),
            ),
          ],
        ),
      ),
    );
  }
}
