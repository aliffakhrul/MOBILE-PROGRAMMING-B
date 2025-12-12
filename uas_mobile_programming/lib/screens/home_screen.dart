// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import 'product_detail_screen.dart';
import 'category_screen.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService service = ProductService();

  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];

  bool loading = true;
  String? error;

  String searchQuery = "";
  String selectedCategory = "All";

  List<String> categories = ["All"];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  // ============================
  //      LOAD DATA + ERROR HANDLING
  // ============================
  Future<void> loadProducts() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      final data = await service.fetchProducts();

      final uniqueCategories = data.map((e) => e.category).toSet().toList();
      categories = ["All", ...uniqueCategories];

      if (!mounted) return;
      setState(() {
        products = data;
        filteredProducts = data;
        loading = false;
      });

    } on SocketException {
      setState(() {
        loading = false;
        error = "Tidak ada koneksi internet.\nPeriksa jaringan Anda.";
      });
    } on HttpException {
      setState(() {
        loading = false;
        error = "Server tidak merespons.\nCoba lagi nanti.";
      });
    } on FormatException {
      setState(() {
        loading = false;
        error = "Format data dari server tidak valid.";
      });
    } catch (e) {
      setState(() {
        loading = false;
        error = "Terjadi kesalahan tidak dikenal:\n$e";
      });
    }
  }

  // ============================
  //              FILTER
  // ============================
  void applyFilters() {
    List<ProductModel> result = products;

    if (selectedCategory != "All") {
      result = result.where((p) => p.category == selectedCategory).toList();
    }

    if (searchQuery.isNotEmpty) {
      result = result
          .where((p) =>
          p.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredProducts = result;
    });
  }

  // ============================
  //           ERROR UI
  // ============================
  Widget buildErrorUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              error ?? "Terjadi kesalahan",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: loadProducts,
              icon: const Icon(Icons.refresh),
              label: const Text("Coba Lagi"),
            ),
          ],
        ),
      ),
    );
  }

  // ============================
  //           MAIN UI
  // ============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      appBar: AppBar(
        title: const Text("Interior Room List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CategoryScreen()),
              );
            },
          )
        ],
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? buildErrorUI()
          : Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                applyFilters();
              },
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // CATEGORY FILTER
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (_, index) {
                final cat = categories[index];
                final active = cat == selectedCategory;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = cat;
                    });
                    applyFilters();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: active ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color:
                        active ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // LIST
          Expanded(
            child: RefreshIndicator(
              onRefresh: loadProducts,
              child: filteredProducts.isEmpty
                  ? const Center(
                child: Text("Tidak ada data ditemukan"),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final p = filteredProducts[index];

                  return Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          p.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey.shade200,
                                child: const Icon(
                                    Icons.broken_image),
                              ),
                        ),
                      ),
                      title: Text(
                        p.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "\$${p.price.toStringAsFixed(2)}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailScreen(product: p),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
