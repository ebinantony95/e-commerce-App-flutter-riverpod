import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';

class BuyNowTile extends StatelessWidget {
  final BuyNowItem item;

  const BuyNowTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(item.imageUrl, width: 100, height: 100),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: Theme.of(context).textTheme.titleMedium),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text("Size: ${item.size}"),

                    const SizedBox(width: 8),
                    Text("Qty: ${item.quantity}"),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  "₹${item.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
