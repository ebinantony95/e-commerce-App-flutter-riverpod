import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/home/brandSection/core/model/brand_model.dart';
import 'package:sneakcom_ecom/features/home/brandSection/ui/widgets/brand_card.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            return BrandCard(brand: brands[index]);
          },
        ),
      ),
    );
  }
}
