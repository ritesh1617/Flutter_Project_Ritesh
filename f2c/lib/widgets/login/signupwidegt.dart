// New reusable LoginForm widget
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController titleController; // Controller for title
  final TextEditingController emailController; // Controller for email
  final TextEditingController passwordController; // Controller for password

  LoginForm({
    required this.titleController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'FORGET PASSWORD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text('Log In'),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              "Don't have an account? REGISTER",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
