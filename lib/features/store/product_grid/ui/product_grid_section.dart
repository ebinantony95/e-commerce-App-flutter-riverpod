import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/provider/filtered_product_provider.dart';
import 'package:sneakcom_ecom/features/store/product_grid/ui/widget/product_card.dart';

class ProductGridSection extends ConsumerWidget {
  const ProductGridSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(filteredProductProvider);

    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];
              return ProductCard(product: product);
            }, childCount: products.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
          ),
        );
      },
      loading: () => const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) {
        // ignore: avoid_print
        print("firestore error: $e");
        return SliverFillRemaining(
          child: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
