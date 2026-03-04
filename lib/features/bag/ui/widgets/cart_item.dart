import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/bag/core/model/cart_model.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_notifier.dart';

class CartItemTile extends ConsumerWidget {
  final CartModel item;
  final String userId;

  const CartItemTile({super.key, required this.item, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: // Product Image
                  Image.network(
                    item.imageUrl,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          //name....
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //size....
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),

                                child: Center(
                                  child: Text("Size: ${item.selectedSize}"),
                                ),
                              ),
                              SizedBox(width: 10),
                              // qty......
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                    ),

                                    child: Center(
                                      child: Text("Qty: ${item.quantity}"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "₹${item.price * item.quantity}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              // ➖ Decrease qty.....
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  ref
                                      .read(cartControllerProvider.notifier)
                                      .decreaseQuantity(
                                        userId: userId,
                                        item: item,
                                      );
                                },
                              ),
                              // ➕ Increase qty.....
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  ref
                                      .read(cartControllerProvider.notifier)
                                      .increaseQuantity(
                                        userId: userId,
                                        item: item,
                                      );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 2,
              top: 2,
              child:
                  // Remove Button
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      ref
                          .read(cartControllerProvider.notifier)
                          .removeFromCart(
                            userId: userId,
                            item: item, // pass entire item
                          );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
