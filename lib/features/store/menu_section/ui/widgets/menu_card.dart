import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/store/menu_section/core/model/menu_model.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class MenuCard extends StatelessWidget {
  final MenuModel menu;
  final bool isSelected;
  const MenuCard({super.key, required this.menu, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.chipColors,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(menu.logo, width: 30, height: 30, fit: BoxFit.contain),
          const SizedBox(width: 8),
          Text(
            menu.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: isSelected
                  ? AppColors.addCartColor
                  : AppColors.fontColorGray,
            ),
          ),
        ],
      ),
    );
  }
}
