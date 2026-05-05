import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class GrayContainer extends StatelessWidget {
  const GrayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return Positioned(
      top: 120,
      left: 10,
      right: 10,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: dark ? AppColors.darkGray : AppColors.gray,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}
