import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class MenuIcon extends StatelessWidget {
  final VoidCallback onpressed;
  const MenuIcon({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);

    return IconButton(
      onPressed: onpressed,
      icon: Icon(Icons.menu),
      color: dark ? Colors.white : Colors.black,
    );
  }
}
