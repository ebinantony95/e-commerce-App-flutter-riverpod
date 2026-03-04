import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/product_detailed/size_chart/core/provider/selected_size_provider.dart';

class SizeSelector extends ConsumerWidget {
  final List<String> sizes;
  final String productId;

  const SizeSelector({super.key, required this.sizes, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSize = ref.watch(selectedSizeProvider(productId));

    return Wrap(
      spacing: 12,
      children: sizes.map((size) {
        final isSelected = selectedSize == size;

        return GestureDetector(
          onTap: () {
            ref.read(selectedSizeProvider(productId).notifier).state = size;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
