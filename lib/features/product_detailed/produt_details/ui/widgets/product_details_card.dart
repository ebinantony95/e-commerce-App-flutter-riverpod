import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/buttons/add_to_cart/add_to_cart_button.dart';
import 'package:sneakcom_ecom/common/buttons/buynow_button.dart';
import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';
import 'package:sneakcom_ecom/features/product_detailed/size_chart/core/provider/selected_size_provider.dart';
import 'package:sneakcom_ecom/features/product_detailed/size_chart/ui/size_selector.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class ProductDetailsCard extends ConsumerWidget {
  final ProductModel product;
  const ProductDetailsCard(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Sizes from product: ${product.sizes}");
    final dark = Helpers.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: dark ? AppColors.fontColorGray : AppColors.chipColors,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: dark ? Colors.white : Colors.black,
                  width: 1,
                ),
              ),

              // image.......
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),

            const SizedBox(height: 30),

            // name......
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // description......
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.description),
            ),

            //price....
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "₹ ${product.price}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // size selection
            SizedBox(height: 10),
            SizeSelector(sizes: product.sizes, productId: product.id),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: AddToCartButton(product: product),
          ),

          // buynow button
          SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: BuynowButton(
              onpressed: () {
                final selectedSize = ref.read(selectedSizeProvider(product.id));
                // checking the size is selected or not
                if (selectedSize == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select size")),
                  );
                  return;
                }

                final buyNowItem = BuyNowItem(
                  productId: product.id,
                  name: product.name,
                  price: product.price,
                  imageUrl: product.imageUrl,
                  size: selectedSize,
                  quantity: 1,
                );

                context.push('/buyNow', extra: [buyNowItem]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
