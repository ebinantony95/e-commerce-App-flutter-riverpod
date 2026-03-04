import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneakcom_ecom/features/wishlist/core/model/wishlist_model.dart';

class WishlistService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  WishlistService(this.firestore, this.auth);

  String get _uid => auth.currentUser!.uid;

  // add to wishlist

  Future<void> addToWishlist(WishlistModel product) async {
    await firestore
        .collection('users')
        .doc(_uid)
        .collection('wishlist')
        .doc(product.productId)
        .set(product.toMap());
  }

  // remove from wishlist
  Future<void> removeFromWishlist(String productId) async {
    await firestore
        .collection('users')
        .doc(_uid)
        .collection('wishlist')
        .doc(productId)
        .delete();
  }

  // stream from firestore-wishlist

  Stream<List<WishlistModel>> getWishlist() {
    return firestore
        .collection('users')
        .doc(_uid)
        .collection('wishlist')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => WishlistModel.fromMap(doc.data()))
              .toList(),
        );
  }
}
