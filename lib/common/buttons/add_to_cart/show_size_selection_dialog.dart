import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_notifier.dart';
import 'package:sneakcom_ecom/features/product_detailed/size_chart/core/provider/selected_size_provider.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';

void showSizeSelectionDialog(
  BuildContext context,
  WidgetRef ref,
  ProductModel product,
  String userId,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Select Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: product.sizes.map((size) {
                return GestureDetector(
                  onTap: () async {
                    // Save selected size
                    ref.read(selectedSizeProvider(product.id).notifier).state =
                        size;

                    // Add to cart
                    await ref
                        .read(cartControllerProvider.notifier)
                        .addToCart(
                          userId: userId,
                          product: product,
                          selectedSize: size,
                        );

                    // Close sheet
                    if (context.mounted) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
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
                    }

                    // Reset state
                    ref.read(selectedSizeProvider(product.id).notifier).state =
                        null;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Text(
                      size,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
