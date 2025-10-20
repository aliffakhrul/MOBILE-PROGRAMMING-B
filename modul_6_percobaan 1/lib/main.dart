import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo GridView'),
        backgroundColor: Colors.amber,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: const [
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 1',
          ),
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 2',
          ),
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 3',
          ),
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 4',
          ),
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 5',
          ),
          GridItem(
            warnaKotak: Colors.blueAccent,
            gambar: 'assets/icon/hq720.jpg',
            judul: 'modul 6',
          ),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Color warnaKotak;
  final String gambar;
  final String judul;

  const GridItem({
    super.key,
    required this.warnaKotak,
    required this.gambar,
    required this.judul,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnaKotak,
        child: GridTile(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              gambar,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red, size: 50);
              },
            ),
          ),
          footer: SizedBox(
            height: 30,
            child: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                judul,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}