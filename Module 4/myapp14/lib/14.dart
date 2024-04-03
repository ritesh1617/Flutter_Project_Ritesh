import 'package:flutter/material.dart';

class AlertDialogButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }



  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert '),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
                size: 40.0,
              ),
              SizedBox(height: 10.0),
              Text('Your Phone is over heat'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}