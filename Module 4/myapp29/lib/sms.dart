import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class smsScreen extends StatelessWidget {
  const smsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Sender"),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: _sendSMS,
            child: Text('Send SMS'),
          ),),
    );
  }



  _sendSMS() async {
    const phoneNumber = '1234567890';
    const message = 'Hello, this is a test SMS!';
    final Uri uri = Uri.parse('sms:$phoneNumber?body=$message');

    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }
}
