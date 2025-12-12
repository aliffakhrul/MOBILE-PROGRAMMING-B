import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(product.image, height: 250),
          const SizedBox(height: 16),
          Text(product.title,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("\$${product.price}",
              style:
              const TextStyle(fontSize: 20, color: Colors.green)),
          const SizedBox(height: 20),
          Text(product.description),
        ],
      ),
    );
  }
}
