import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String productId;
  final String name;
  final double price;
  final String imageUrl;
  final String selectedSize;
  final int quantity;
  final Timestamp addedAt;

  CartModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.selectedSize,
    required this.quantity,
    required this.addedAt,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['productId'],
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
      selectedSize: map['selectedSize'] ?? map['size'] ?? '',
      quantity: map['quantity'],
      addedAt: map['addedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'selectedSize': selectedSize,
      'quantity': quantity,
      'addedAt': FieldValue.serverTimestamp(),
    };
  }
}
