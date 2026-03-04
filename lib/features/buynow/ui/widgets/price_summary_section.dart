import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';
import 'package:sneakcom_ecom/features/payment%20screen/core/models/payment_model.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class PriceSummarySection extends StatelessWidget {
  final List<BuyNowItem> items;

  const PriceSummarySection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final subtotal = items.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    const platformFee = 7.0;
    const deliveryFee = 40.0;

    final total = subtotal + platformFee + deliveryFee;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("MRP: ₹$subtotal"),
          const SizedBox(height: 4),
          const Text("Platform Fee: ₹7"),
          const Text("Delivery Fee: ₹40.0"),
          const SizedBox(height: 6),
          Text(
            "Total: ₹$total",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.addCartColor,
              ),
              onPressed: items.isEmpty
                  ? null
                  : () {
                      final checkoutModel = CheckoutModel(
                        items: items,
                        subtotal: subtotal,
                        platformFee: platformFee,
                        deliveryFee: deliveryFee,
                        total: total,
                      );

                      context.pushNamed('payment', extra: checkoutModel);
                    },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
