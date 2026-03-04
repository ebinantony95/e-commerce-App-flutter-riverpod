import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/home/brandSection/core/model/brand_model.dart';

class BrandCard extends StatelessWidget {
  final BrandModel brand;
  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(brand.logo, width: 30, height: 30, fit: BoxFit.contain),
          const SizedBox(width: 8),
          Text(
            brand.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
