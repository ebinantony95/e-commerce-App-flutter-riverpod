import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/buttons/buynow_button.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_stream_provider.dart';
import 'package:sneakcom_ecom/features/bag/ui/widgets/cart_item.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';

class CartScreen extends ConsumerWidget {
  final String userId;

  const CartScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Bag")),
      body: cartAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (cartItems) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemTile(item: item, userId: userId);
                  },
                ),
              ),

              // Fixed Bottom Button
              if (cartItems.isNotEmpty)
                Positioned(
                  bottom: 0,
                  left: 15,
                  right: 15,
                  child: BuynowButton(
                    onpressed: () {
                      final cartItems =
                          ref.read(cartStreamProvider(userId)).value ?? [];

                      final buyNowItems = cartItems.map((item) {
                        return BuyNowItem(
                          productId: item.productId,
                          name: item.name,
                          price: item.price,
                          imageUrl: item.imageUrl,
                          size: item.selectedSize,
                          quantity: item.quantity,
                        );
                      }).toList();

                      context.push('/buyNow', extra: buyNowItems);
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
