import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/store/menu_section/core/model/menu_model.dart';
import 'package:sneakcom_ecom/features/store/menu_section/core/providers/selected_brand_provider.dart';
import 'package:sneakcom_ecom/features/store/menu_section/ui/widgets/menu_card.dart';

class MenuSection extends ConsumerWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get the value of selected item form brand card
    final selectedBrand = ref.watch(selectedBrandProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            final item = menu[index];
            final isSelected =
                selectedBrand == null && item.name == "ll" ||
                selectedBrand == item.name;
            return GestureDetector(
              onTap: () {
                if (item.name == 'All') {
                  ref.read(selectedBrandProvider.notifier).state = null;
                } else {
                  ref.read(selectedBrandProvider.notifier).state = item.name;
                }
              },
              child: MenuCard(menu: item, isSelected: isSelected),
            );
          },
        ),
      ),
    );
  }
}
