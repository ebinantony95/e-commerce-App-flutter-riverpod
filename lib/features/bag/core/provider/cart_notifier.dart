import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/bag/core/model/cart_model.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_repository_provider.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';

final cartControllerProvider = AsyncNotifierProvider<CartController, void>(
  CartController.new,
);

class CartController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  // ✅ Add to cart
  Future<void> addToCart({
    required String userId,
    required ProductModel product,
    required String selectedSize,
  }) async {
    state = const AsyncLoading();

    try {
      final repo = ref.read(cartRepositoryProvider);

      await repo.addToCart(
        userId: userId,
        product: product,
        selectedSize: selectedSize,
      );

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // ✅ Remove from cart (FIXED)
  Future<void> removeFromCart({
    required String userId,
    required CartModel item,
  }) async {
    final repo = ref.read(cartRepositoryProvider);

    await repo.removeFromCart(
      userId: userId,
      productId: item.productId,
      selectedSize: item.selectedSize, // 🔥 IMPORTANT
    );
  }

  // ✅ Increase quantity (FIXED)
  Future<void> increaseQuantity({
    required String userId,
    required CartModel item,
  }) async {
    final repo = ref.read(cartRepositoryProvider);

    await repo.updateQuantity(
      userId: userId,
      productId: item.productId,
      selectedSize: item.selectedSize, // 🔥 IMPORTANT
      newQty: item.quantity + 1,
    );
  }

  // ✅ Decrease quantity (FIXED)
  Future<void> decreaseQuantity({
    required String userId,
    required CartModel item,
  }) async {
    final repo = ref.read(cartRepositoryProvider);

    if (item.quantity > 1) {
      await repo.updateQuantity(
        userId: userId,
        productId: item.productId,
        selectedSize: item.selectedSize, // 🔥 IMPORTANT
        newQty: item.quantity - 1,
      );
    } else {
      await repo.removeFromCart(
        userId: userId,
        productId: item.productId,
        selectedSize: item.selectedSize, // 🔥 IMPORTANT
      );
    }
  }
}
