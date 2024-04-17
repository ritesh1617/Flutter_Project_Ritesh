
import 'package:flutter/material.dart';
import 'package:myapp28/showScreen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Numbers'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'First Number'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: secondNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Second Number'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int firstNumber = int.tryParse(firstNumberController.text) ?? 0;
                  int secondNumber = int.tryParse(secondNumberController.text) ?? 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(firstNumber, secondNumber),
                    ),
                  );
                },
                child: Text('Calculate Sum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}