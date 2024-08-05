// New reusable LoginForm widget
import 'package:f2c/widgets/Customtextfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final String frogetpassword;
  final String buttontext;
  final String textbutton;
  final String label;
  final bool obscureText;
  final Function(String) onChanged;
  final IconData licon;
  final String label2;
  final bool obscureText2;
  final Function(String) onChanged2;
  final IconData licon2;

  const LoginForm({
    super.key,
    required this.frogetpassword,
    required this.buttontext,
    required this.textbutton,
    required this.label,
    required this.obscureText,
    required this.onChanged,
    required this.licon,
    required this.label2,
    required this.obscureText2,
    required this.onChanged2,
    required this.licon2,
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
          TextField(
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                licon,
                color: Colors.white,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            obscureText: obscureText2,
            onChanged: onChanged2,
            decoration: InputDecoration(
              labelText: label2,
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                licon2,
                color: Colors.white,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
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
                  frogetpassword,
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
            child: Text(buttontext),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {},
            child: Text(
              textbutton,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
