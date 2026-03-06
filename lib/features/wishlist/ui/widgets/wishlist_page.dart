import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/wishlist/core/provider/wishlist_service_provider.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistAsync = ref.watch(wishlistProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: wishlistAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text("No items in wishlist"));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return SizedBox(
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
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 20),

                                  SizedBox(height: 10),
                                  Text(
                                    "₹${item.price}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 2,
                          top: 2,
                          child: // Remove Button
                          IconButton(
                            icon: const Icon(Icons.close_sharp),
                            onPressed: () {
                              ref
                                  .read(wishlistServiceProvider)
                                  .removeFromWishlist(item.productId);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
