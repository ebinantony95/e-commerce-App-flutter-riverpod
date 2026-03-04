import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/wishlist/ui/widgets/wishlist_icon.dart';
import 'package:sneakcom_ecom/common/buttons/add_to_cart/add_to_cart_button.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('productDetails', pathParameters: {'id': product.id});
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.chipColors,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PRODUCT IMAGE
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                /// BRAND
                Text(
                  product.brand,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.fontColorGray,
                  ),
                ),

                const SizedBox(height: 4),

                /// PRODUCT NAME
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                /// PRICE
                Text(
                  "₹ ${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                /// ADD TO CART BUTTON
                SizedBox(
                  width: double.infinity,
                  child: AddToCartButton(product: product),
                ),
              ],
            ),
            // wishlist icon
            Positioned(
              right: 3,
              top: 3,
              child: WishlistIcon(productModel: product),
            ),
          ],
        ),
      ),
    );
  }
}
