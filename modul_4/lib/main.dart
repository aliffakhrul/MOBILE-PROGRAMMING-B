import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Text('Pemutar Musik', style: TextStyle(fontSize: 30)),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(30),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bottomBarCustom(iconBar: Icons.shuffle, intFlex: 1, iconSize: 35),
              bottomBarCustom(
                iconBar: Icons.skip_previous,
                intFlex: 1,
                iconSize: 35,
              ),
              bottomBarCustom(
                iconBar: Icons.play_circle_fill,
                intFlex: 2,
                iconSize: 60,
              ),
              bottomBarCustom(
                iconBar: Icons.skip_next,
                intFlex: 1,
                iconSize: 35,
              ),
              bottomBarCustom(
                iconBar: Icons.library_add,
                intFlex: 1,
                iconSize: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class bottomBarCustom extends StatelessWidget {
  final IconData iconBar;
  final int intFlex;
  final double iconSize;

  const bottomBarCustom({
    super.key,
    required this.iconBar,
    required this.intFlex,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: intFlex,
      child: Icon(iconBar, color: Colors.white, size: iconSize),
    );
  }
}
