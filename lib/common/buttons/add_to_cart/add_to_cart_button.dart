import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/common/buttons/add_to_cart/show_size_selection_dialog.dart';
import 'package:sneakcom_ecom/features/authencation/core/screen_controllers/auth_stateprovier.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_notifier.dart';
import 'package:sneakcom_ecom/features/product_detailed/size_chart/core/provider/selected_size_provider.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class AddToCartButton extends ConsumerWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messenger = ScaffoldMessenger.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.addCartColor,
        borderRadius: BorderRadius.circular(20),
      ),

      width: 40,
      child: SizedBox(
        child: TextButton(
          onPressed: () async {
            final user = ref.watch(authStateProvider).value;

            // null check HERE
            if (user == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please login first")),
              );
              return;
            }

            final selectedSize = ref.read(selectedSizeProvider(product.id));

            if (selectedSize == null) {
              showSizeSelectionDialog(context, ref, product, user.uid);
              return;
            }

            await ref
                .read(cartControllerProvider.notifier)
                .addToCart(
                  userId: user.uid,
                  product: product,
                  selectedSize: selectedSize,
                );

            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: const Text("Product added to cart 🛒"),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
          },
          child: Text(
            'Add to cart',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
