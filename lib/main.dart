import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Program Pertamaku')),
        body: Center(
          child: Text('Alif Fakhrul Hakim', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
