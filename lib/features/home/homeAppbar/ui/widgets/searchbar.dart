import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.65,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: dark ? Colors.white : Colors.black),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search here..',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          Icon(Icons.search, color: Colors.black),
        ],
      ),
    );
  }
}
