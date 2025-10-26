import 'package:flutter/material.dart';

import '../main.dart';

class DetailRuanganPage extends StatelessWidget {
  final Map<String, String> ruangan;

  const DetailRuanganPage({super.key, required this.ruangan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(12, 79, 115, 1),
        title: Text(
          ruangan['nama']!,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // warna back button putih
        automaticallyImplyLeading: true, // pastikan tombol back muncul
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 400,
            child: Image.asset(
              ruangan['gambar']!,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Text(
              'Deskripsi untuk ${ruangan['nama']}.\n\nRuangan ini dapat digunakan untuk kegiatan akademik seperti rapat, kelas, atau seminar tergantung kebutuhannya.',
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const MainPage(),
                ),
              );
            },
            child: Container(
              width: 270,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(12, 79, 115, 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Pinjam Ruangan Ini',
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
