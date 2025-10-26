import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/presentations/detail_ruangan.dart';

class ListRuangan extends StatefulWidget {
  const ListRuangan({super.key});

  @override
  State<ListRuangan> createState() => _ListRuanganState();
}

class _ListRuanganState extends State<ListRuangan> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, String>> ruanganList = [
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
    // filter ruangan sesuai keyword pencarian
    final filteredRuangan = ruanganList
        .where((r) =>
        r['nama']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🔍 Search Bar
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari ruangan...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🧱 Grid ruangan
            RuanganGridPage(ruanganList: filteredRuangan),
          ],
        ),
      ),
    );
  }
}

class RuanganGridPage extends StatelessWidget {
  final List<Map<String, String>> ruanganList;

  const RuanganGridPage({super.key, required this.ruanganList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ruanganList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final ruangan = ruanganList[index];
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailRuanganPage(ruangan: ruangan),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      ruangan['gambar']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ruangan['nama']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
      },
    );
  }
}
