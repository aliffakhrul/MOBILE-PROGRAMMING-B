import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Malang', style: TextStyle(fontSize: 40)),
                ),
              ),
            ),
            Expanded(child: Center(child: Text('25℃', style: TextStyle(fontSize: 100)))),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CuacaBesok(iconCuaca: Icons.sunny, hari: 'Minggu', suhu: '25℃'),
                  CuacaBesok(iconCuaca: Icons.cloud, hari: 'Senin', suhu: '18℃'),
                  CuacaBesok(iconCuaca: Icons.thunderstorm, hari: 'Selasa', suhu: '13℃'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CuacaBesok extends StatelessWidget {
  final IconData iconCuaca;
  final String hari;
  final String suhu;

  const CuacaBesok({
    super.key,
    required this.iconCuaca,
    required this.hari,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(hari, style: TextStyle(fontSize: 20)),
          Icon(iconCuaca, size: 40),
          Text(suhu, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
