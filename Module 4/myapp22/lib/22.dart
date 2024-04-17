import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailcontroller,
          ),
          TextFormField(
            controller: passwordcontroller,
          ),
          ElevatedButton(onPressed: (){}, child: Text("Login"))
        ],
      ),
    );
  }
}