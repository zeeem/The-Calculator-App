import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_calculator_app/views/calculator_view.dart';

void main() {
  runApp(MyApp());
}

/// the main view/ui file is calculator_view.dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
