import 'package:flutter/material.dart';
import 'detail_ruangan.dart';
import 'list_ruangan.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  final List<Map<String, String>> semuaRuangan = [
    {'nama': 'Lab Komputer', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Rapat', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Kelas A', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Kelas B', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Multimedia', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Seminar', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Ruang Dosen', 'gambar': 'assets/ruang/lab.jpeg'},
    {'nama': 'Aula Utama', 'gambar': 'assets/ruang/lab.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    final ruanganTeratas = semuaRuangan.take(4).toList();
    final ruanganDipinjam = semuaRuangan.take(1).toList(); // hanya 1 card

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(12, 79, 115, 1),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Senin, 27 Oktober 2025',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeBanner(),
            const InfoCard(),
            const SizedBox(height: 20),

            // --- Bagian Ruangan yang Dipinjam ---
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
              child: Text(
                'Daftar ruangan yang dipinjam:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                children: [
                  ...ruanganDipinjam.map((ruang) =>
                      _buildRuanganDipinjamCard(context, ruang)),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
              child: Text(
                'Daftar Ruangan:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                children: [
                  ...ruanganTeratas.map((ruang) => _buildRuanganCard(context, ruang)),
                  _buildTampilkanSemuaCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Card Ruangan Umum ---
  Widget _buildRuanganCard(BuildContext context, Map<String, String> ruang) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailRuanganPage(ruangan: ruang),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  ruang['gambar']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ruang['nama']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Card Tampilkan Semua ---
  Widget _buildTampilkanSemuaCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ListRuangan()),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios, color: Colors.blueAccent, size: 40),
              SizedBox(height: 8),
              Text(
                "Tampilkan Semua",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Card Ruangan yang Dipinjam (dengan indikator hijau) ---
  Widget _buildRuanganDipinjamCard(
      BuildContext context, Map<String, String> ruang) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailRuanganPage(ruangan: ruang),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      ruang['gambar']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ruang['nama']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            // --- Lingkaran hijau di pojok kiri atas ---
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Komponen tambahan ---
class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(12, 79, 115, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Datang di Aplikasi PinjamRuang',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Halo Alif!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  void _showGuideDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Guide PinjamRuang',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. User memilih ruangan dari halaman daftar ruangan.'),
            SizedBox(height: 5),
            Text(
                '2. Setelah memilih ruangan, isi data yang diperlukan di form peminjaman ruangan.'),
            SizedBox(height: 5),
            Text(
                '3. Setelah semua data diinputkan, tekan tombol submit untuk mengirimkan data.'),
            SizedBox(height: 5),
            Text(
                '4. Tunggu hingga admin menyetujui peminjaman ruangan yang diajukan.'),
            SizedBox(height: 5),
            Text(
                '5. Jika peminjaman ruangan sudah disetujui/acc maka peminjaman berhasil.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showGuideDialog(context),
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Guide Peminjaman Ruangan',
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
