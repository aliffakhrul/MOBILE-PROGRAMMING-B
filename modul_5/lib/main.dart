import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Sedang Memutar'), centerTitle: true,),
        body: Center(
          child: Card(
            color: Colors.black12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Icon(Icons.album, size: 250, color: Colors.blueGrey,),),
                ListTile(
                  trailing: Icon(Icons.heart_broken, color: Colors.red),
                  title: Text(
                    'Disini Ada Judul Lagu',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Disini ada nama artis'),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
