import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';

class CartRepository {
  final FirebaseFirestore _firestore;

  CartRepository(this._firestore);

  //add to cart.....

  Future<void> addToCart({
    required String userId,
    required ProductModel product,
    required String selectedSize,
  }) async {
    //for accepting diff size as diff product
    final cartDocId = "${product.id}_$selectedSize";

    final cartRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(cartDocId);

    await _firestore.runTransaction((transaction) async {
      final cartSnap = await transaction.get(cartRef);

      if (cartSnap.exists) {
        transaction.update(cartRef, {'quantity': FieldValue.increment(1)});
      } else {
        transaction.set(cartRef, {
          'productId': product.id,
          'name': product.name,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'selectedSize': selectedSize,
          'quantity': 1,
          'addedAt': FieldValue.serverTimestamp(),
        });
      }
    });

    // print("🔥 SAVED TO FIRESTORE 🔥");
  }

  // remove
  Future<void> removeFromCart({
    required String userId,
    required String productId,
    required String selectedSize,
  }) async {
    final cartDocId = "${productId}_$selectedSize";

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(cartDocId)
        .delete();
  }

  Future<void> updateQuantity({
    required String userId,
    required String productId,
    required String selectedSize,
    required int newQty,
  }) async {
    final cartDocId = "${productId}_$selectedSize";

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(cartDocId)
        .update({'quantity': newQty});
  }
}
