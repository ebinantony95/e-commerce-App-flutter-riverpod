import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/widgets/menu_icon.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/widgets/notification_icon.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/widgets/searchbar.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/widgets/wishlist_icon.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';

class HomeAppbar extends StatelessWidget {
  final VoidCallback onMenuTap;
  const HomeAppbar({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            // logo and name
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(Myimages.logoRedpart, fit: BoxFit.cover),
                ),
                const SizedBox(width: 10),
                // Hi User
                const Text(
                  'Hi User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                // menu icon
                MenuIcon(onpressed: onMenuTap),
              ],
            ),

            Row(
              children: [
                // searchbar....
                Searchbar(),
                SizedBox(width: 20),
                // notification icon
                NotificationIcon(),
                //wishlist icon
                WishlistIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
