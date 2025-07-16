import 'package:flutter/material.dart';
import 'package:flutter_cpp_ai/src/model/math_connection_type.dart';
import 'package:flutter_cpp_ai/src/model/math_request.dart';
import 'package:flutter_cpp_ai/src/service/math_service.dart';
import 'package:flutter_cpp_ai/src/ui/helper/number_field.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key, required this.type});

  final MathConnectionType type;

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  final _xController = TextEditingController();
  final _yController = TextEditingController();

  MathService? _service;

  String _value = "";
  String _result = "";

  _addNumbers() {
    final request = MathRequest.fromString(_xController.text, _yController.text);

    _service!.add(request).then((response) {
      setState(() {
        _value = response.answer.toString();
        _result = response.duration;
      });
    });
  }

  @override
  void initState() {
    _service = MathService(widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NumberField(
              controller: _xController,
              hintText: "First number",
            ),
            NumberField(
              controller: _yController,
              hintText: "Second number",
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addNumbers,
              child: const Text("Sum numbers"),
            ),
            const SizedBox(height: 32),
            Center(child: Text(_value, style: TextStyle(fontSize: 36))),
            Center(child: Text(_result, style: TextStyle(fontSize: 18)))
          ],
        ),
      ),
    );
  }
}
