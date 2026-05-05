import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/bag/core/model/cart_model.dart';

final cartStreamProvider = StreamProvider.family<List<CartModel>, String>((
  ref,
  userId,
) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('cart')
      .orderBy('addedAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => CartModel.fromMap(doc.data())).toList(),
      );
});
