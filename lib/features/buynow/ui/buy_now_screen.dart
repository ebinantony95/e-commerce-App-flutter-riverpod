import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';
import 'package:sneakcom_ecom/features/buynow/ui/widgets/buy_now_tile.dart';
import 'package:sneakcom_ecom/features/buynow/ui/widgets/price_summary_section.dart';

class BuyNowScreen extends StatelessWidget {
  final List<BuyNowItem> items;

  const BuyNowScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buy Now")),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final item = items[index];
                    return BuyNowTile(item: item);
                  },
                ),
              ),
              PriceSummarySection(items: items),
            ],
          ),
        ],
      ),
    );
  }
}
