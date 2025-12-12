import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModel>> fetchProducts() async {
    final uri = Uri.parse("$baseUrl/products");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal memuat produk: ${response.statusCode}");
    }
  }

  Future<List<String>> fetchCategories() async {
    final uri = Uri.parse("$baseUrl/products/categories");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception("Gagal memuat kategori: ${response.statusCode}");
    }
  }

  Future<List<ProductModel>> fetchCategoryProducts(String category) async {
    final uri = Uri.parse("$baseUrl/products/category/$category");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal memuat produk kategori: ${response.statusCode}");
    }
  }
}
