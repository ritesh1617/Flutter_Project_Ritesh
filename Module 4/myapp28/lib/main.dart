import 'package:flutter/material.dart';
import 'package:myapp28/inputScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sum Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}


