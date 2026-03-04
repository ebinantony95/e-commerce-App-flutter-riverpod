import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/icons/icons.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class WishlistIcon extends StatelessWidget {
  const WishlistIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return Appicons(
      iconsize: 30,
      iconName: Icons.favorite_border,
      iconColor: dark ? Colors.white : Colors.black,
      onpressed: () {
        context.pushNamed('wishlist');
      },
    );
  }
}
