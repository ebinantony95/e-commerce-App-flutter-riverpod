import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/home_appbar.dart';
import 'package:sneakcom_ecom/features/store/menu_section/ui/menu_section.dart';
import 'package:sneakcom_ecom/features/store/product_grid/ui/product_grid_section.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          //homeapp bar
          SliverToBoxAdapter(child: HomeAppbar(onMenuTap: () {})),
          // menu section
          SliverToBoxAdapter(child: MenuSection()),
          //product grid
          ProductGridSection(),
        ],
      ),
    );
  }
}
