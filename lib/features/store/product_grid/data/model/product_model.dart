import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> sizes;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.sizes,
  });

  /// ✅ Works for BOTH DocumentSnapshot & QueryDocumentSnapshot
  factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    if (data == null) {
      throw Exception("Product document is empty!");
    }

    return ProductModel(
      id: doc.id,
      name: data['name'] ?? '',
      brand: data['brand'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] is num
          ? (data['price'] as num).toDouble()
          : double.tryParse(data['price'].toString()) ?? 0.0,
      imageUrl: data['imageUrl'] ?? '',
      category: data['category'] ?? '',
      sizes:
          (data['size'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
          [],
    );
  }

  /// ✅ Used when reading from cart/local storage
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      sizes: List<String>.from(map['size'] ?? []),
    );
  }

  /// ✅ Used when saving to Firestore/cart
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'sizes': sizes,
    };
  }
}
