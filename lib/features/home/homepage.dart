import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/common/styles/gray_container.dart';
import 'package:sneakcom_ecom/common/reusable_widgets/heading_with_view_all.dart';
import 'package:sneakcom_ecom/features/account/app_drawer.dart';
import 'package:sneakcom_ecom/features/home/banners/ui/app_banners.dart';
import 'package:sneakcom_ecom/features/home/brandSection/ui/brand_section.dart';
import 'package:sneakcom_ecom/features/home/homeAppbar/ui/home_appbar.dart';
import 'package:sneakcom_ecom/features/home/product_showcase/ui/new_arrival_section.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/constants/text_strings.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            /// 🔹 Grey Background Container
            GrayContainer(),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HomeAppbar(
                    onMenuTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverToBoxAdapter(child: AppBanners()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: HeadingWithViewAll(
                    heading: Textstrings.popularBrands,
                    subHeading: Textstrings.viewAll,
                    color: AppColors.fontColorGray,
                    onpressed: () {},
                  ),
                ),
                SliverToBoxAdapter(child: BrandSection()),

                SliverToBoxAdapter(
                  child: HeadingWithViewAll(
                    heading: Textstrings.newArrivals,
                    subHeading: Textstrings.viewAll,
                    color: AppColors.fontColorGray,
                    onpressed: () {},
                  ),
                ),
                SliverToBoxAdapter(child: NewArrivalSection()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
