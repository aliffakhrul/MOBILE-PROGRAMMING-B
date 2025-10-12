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
        appBar: AppBar(
          title: Text('Row and Column'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomIconBox(
                    icon: Icons.favorite,
                    text: "Love",
                    color: Colors.brown,
                    colorIcon: Colors.red,
                  ),
                  SizedBox(width: 20),
                  CustomIconBox(
                    icon: Icons.thumb_up,
                    text: "Like",
                    colorIcon: Colors.blueAccent,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomIconBox(
                    icon: Icons.star,
                    text: "Star",
                    colorIcon: Colors.yellow,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 20),
                  CustomIconBox(
                    icon: Icons.circle,
                    text: "Circle",
                    colorIcon: Colors.green,
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color colorIcon;

  const CustomIconBox({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Icon(icon, color: colorIcon, size: 50),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
