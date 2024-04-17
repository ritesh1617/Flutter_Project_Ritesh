

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int firstNumber;
  final int secondNumber;

  ResultScreen(this.firstNumber, this.secondNumber);

  @override
  Widget build(BuildContext context) {
    int sum = firstNumber + secondNumber;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The sum of $firstNumber and $secondNumber is:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$sum',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
