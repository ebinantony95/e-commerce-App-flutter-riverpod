import 'package:sneakcom_ecom/features/address_and_phone/core/models/address_model.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? phone;
  final String? photoUrl;
  final DateTime createdAt;
  final int cartCount;
  final int wishlistCount;
  final bool isActive;
  final String role;
  final AddressModel? address;
  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.phone,
    this.photoUrl,
    required this.createdAt,
    required this.cartCount,
    required this.wishlistCount,
    required this.isActive,
    required this.role,
    this.address,
  });

  /// Convert Firestore → UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'],
      photoUrl: map['photoUrl'],
      createdAt: map['createdAt'] != null
          ? map['createdAt'].toDate()
          : DateTime.now(),
      cartCount: map['cartCount'] ?? 0,
      wishlistCount: map['wishlistCount'] ?? 0,
      isActive: map['isActive'] ?? true,
      role: map['role'] ?? 'user',
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'])
          : null,
    );
  }

  /// Convert UserModel → Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
      'cartCount': cartCount,
      'wishlistCount': wishlistCount,
      'isActive': isActive,
      'role': role,
      'address': address?.toMap(),
    };
  }
}
