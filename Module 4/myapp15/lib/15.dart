
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Example'),
      ),
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
          title: Text('Choose an option'),
          content: Text('What would you like to do?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Positive Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Positive'),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Negative Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Negative'),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Neutral Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Neutral'),
            ),
          ],
        );
      },
    );
  }
}