import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo ListView Baru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            listTile(
              Colors.lightBlue.shade100,
              Colors.deepPurple.shade200,
              'Absensi',
              'Catatan kehadiran harian mahasiswa',
              'assets/icon/hq720.jpg',
            ),
            listTile(
              Colors.teal.shade100,
              Colors.orange.shade200,
              'Agenda Kuliah',
              'Lihat jadwal perkuliahan mingguan',
              'assets/icon/hq720.jpg',
            ),
            listTile(
              Colors.amber.shade100,
              Colors.green.shade300,
              'Tugas & Proyek',
              'Pantau tugas yang belum dikumpulkan',
              'assets/icon/hq720.jpg',
            ),
            listTile(
              Colors.red.shade100,
              Colors.pink.shade200,
              'Berita Kampus',
              'Informasi terbaru seputar kegiatan kampus',
              'assets/icon/hq720.jpg',
            ),
            listTile(
              Colors.purple.shade100,
              Colors.blueAccent.shade100,
              'Nilai Akademik',
              'Lihat hasil ujian dan tugas semester ini',
              'assets/icon/hq720.jpg',
            ),
            listTile(
              Colors.green.shade100,
              Colors.cyan.shade200,
              'Catatan Dosen',
              'Pesan dan pengingat penting dari dosen',
              'assets/icon/hq720.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

Container listTile(
    Color warna,
    Color warnaAvatar,
    String judul,
    String subjudul,
    String gambar,
    ) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: ListTile(
      tileColor: warna,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        judul,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subjudul, style: const TextStyle(fontSize: 15)),
      leading: CircleAvatar(
        backgroundColor: warnaAvatar,
        child: Image.asset(gambar, width: 30, height: 30),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54),
    ),
  );
}
