import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';

final productDetailsProvider = StreamProvider.family<ProductModel, String>((
  ref,
  productId,
) {
  return FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .snapshots()
      .map((doc) => ProductModel.fromSnapshot(doc));
});
