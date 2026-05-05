import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/shared/icons/icons.dart';
import 'package:sneakcom_ecom/core/util/helpers/helpers.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return Appicons(
      iconsize: 30,
      iconName: Icons.notifications_none,
      iconColor: dark ? Colors.white : Colors.black,
      onpressed: () {},
    );
  }
}
