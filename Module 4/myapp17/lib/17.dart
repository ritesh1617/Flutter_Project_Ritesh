import 'package:flutter/material.dart';

class ExitConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _exitApp(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Confirmation'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _exitApp(context);
            },
            child: Text('Exit App'),
          ),
        ),
      ),
    );
  }

  Future<bool> _exitApp(BuildContext context) async {
    final shouldExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }
}