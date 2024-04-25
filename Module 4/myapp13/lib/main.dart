import 'package:flutter/material.dart';
import 'package:myapp13/Screens/Home_Screen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomeScreen(),
      
    );
  }
}