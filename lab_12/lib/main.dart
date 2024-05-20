import 'package:flutter/material.dart';
import 'classes/CoffeeMachine.dart';
import 'classes/Resources.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
