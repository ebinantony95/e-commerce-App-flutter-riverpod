import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistModel {
  final String productId;
  final String name;
  final double price;
  final String imageUrl;

  WishlistModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      productId: map['productId'],
      name: map['name'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'addedAt': FieldValue.serverTimestamp(),
    };
  }
}
