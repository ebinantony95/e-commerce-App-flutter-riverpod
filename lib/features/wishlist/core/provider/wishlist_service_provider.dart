import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/authentication/core/screen_controllers/auth_provider.dart';
import 'package:sneakcom_ecom/features/wishlist/core/model/wishlist_model.dart';
import 'package:sneakcom_ecom/features/wishlist/core/provider/firebase_firestore_provider.dart';
import 'package:sneakcom_ecom/features/wishlist/core/service/wishlist_service.dart';

final wishlistServiceProvider = Provider<WishlistService>((ref) {
  final firestore = ref.read(firebaseFirestoreProvider);
  final auth = ref.read(firebaseAuthProvider);

  return WishlistService(firestore, auth);
});

final wishlistProvider = StreamProvider<List<WishlistModel>>((ref) {
  return ref.read(wishlistServiceProvider).getWishlist();
});
