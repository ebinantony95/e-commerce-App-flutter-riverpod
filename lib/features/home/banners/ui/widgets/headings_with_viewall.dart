import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/constants/text_strings.dart';

class HeadingsWithViewall extends StatelessWidget {
  const HeadingsWithViewall({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Textstrings.popularBrands,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: AppColors.fontColorGray),
          ),
          Text(
            Textstrings.viewAll,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColors.fontColorGray),
          ),
        ],
      ),
    );
  }
}
