import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            height: 400,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Column(
              children: [
                Text('Login', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
