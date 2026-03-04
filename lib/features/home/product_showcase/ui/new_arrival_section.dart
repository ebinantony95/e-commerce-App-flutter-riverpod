import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/home/product_showcase/core/providers/new_arrival_provider.dart';
import 'package:sneakcom_ecom/common/buttons/add_to_cart/add_to_cart_button.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class NewArrivalSection extends ConsumerWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(newArruvalProvider);
    return productsAsync.when(
      data: (products) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,

              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 200,
                  padding: const EdgeInsets.all(0),

                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      // wishlist icon

                      //image
                      Positioned(
                        right: 10,
                        left: 10,
                        top: 10,
                        child: Column(
                          children: [
                            // image
                            SizedBox(
                              width: 140,
                              height: 100,
                              child: Image.network(
                                product.imageUrl,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported);
                                },
                              ),
                            ),

                            // brand and description container
                            Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.chipColors,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //brand
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product.brand,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.black),
                                          textAlign: TextAlign.left,
                                        ), // price
                                        Text(
                                          "\$${product.price}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //description
                                    Text(
                                      product.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: AppColors.darkGray),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // add to cart button
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: AddToCartButton(product: product),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text("Error: $e"),
    );
  }
}
