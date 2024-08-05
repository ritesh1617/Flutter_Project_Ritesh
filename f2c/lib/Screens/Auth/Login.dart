import 'package:f2c/Theme/strings.dart';
import 'package:f2c/widgets/login/signupwidegt.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginsignup),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(
                titleController: titleController,
                emailController: emailController,
                passwordController: passwordController,
              ), // Use the new LoginForm widget
            ),
          ),
          // Bottom Circle Avatars
        ],
      ),
    );
  }
}
