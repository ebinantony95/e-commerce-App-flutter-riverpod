import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';
import 'package:sneakcom_ecom/features/wishlist/core/model/wishlist_model.dart';
import 'package:sneakcom_ecom/features/wishlist/core/provider/wishlist_service_provider.dart';

class WishlistIcon extends ConsumerWidget {
  final ProductModel productModel;
  const WishlistIcon({super.key, required this.productModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistAsync = ref.watch(wishlistProvider);

    return wishlistAsync.when(
      data: (wishlist) {
        final isInWishlist = wishlist.any(
          (item) => item.productId == productModel.id,
        );

        return IconButton(
          onPressed: () {
            if (isInWishlist) {
              ref
                  .read(wishlistServiceProvider)
                  .removeFromWishlist(productModel.id);
            } else {
              final product = WishlistModel(
                productId: productModel.id,
                name: productModel.name,
                price: productModel.price,
                imageUrl: productModel.imageUrl,
              );

              ref.read(wishlistServiceProvider).addToWishlist(product);
            }
          },
          icon: Icon(
            isInWishlist ? Icons.favorite : Icons.favorite_border,
            color: isInWishlist ? Colors.redAccent : Colors.black,
          ),
        );
      },
      loading: () => const SizedBox(),
      error: (_, _) => const SizedBox(),
    );
  }
}
