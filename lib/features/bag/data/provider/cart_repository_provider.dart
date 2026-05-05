import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/firestore_provider.dart';
import 'package:sneakcom_ecom/features/bag/core/service/cart_repository.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final firestore = ref.read(firestoreProvider);
  return CartRepository(firestore);
});
