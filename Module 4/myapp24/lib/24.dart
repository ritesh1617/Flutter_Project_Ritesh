import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class PhoneCallScreen extends StatefulWidget {
  @override
  _PhoneCallScreenState createState() => _PhoneCallScreenState();
}

class _PhoneCallScreenState extends State<PhoneCallScreen> {
  @override
  void initState() {
    super.initState();
    _requestPhoneCallPermission();
  }

  void _requestPhoneCallPermission() async {
    if (await Permission.phone.request().isGranted) {
      // Permission already granted
      print("Phone call permission granted");
    } else {
      
      showDialog( 
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Permission Required"),
            content: Text("This app requires permission to make phone calls."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Deny"),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings(); // Open app settings to grant permission
                },
                child: Text("Allow"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call App"),
      ),
      body: Center(
        child: Text("Welcome to the Phone Call App"),
      ),
    );
  }
}
