import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/home/banners/core/banner_index_provider.dart';
import 'package:sneakcom_ecom/features/home/banners/ui/widgets/app_sub_banners.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';

class AppBanners extends ConsumerWidget {
  const AppBanners({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bannerIndexProvider);

    //banner images
    final images = [
      Myimages.mainBanner1,
      Myimages.mainBanner2,
      Myimages.mainBanner3,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          //carousel
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  ref.read(bannerIndexProvider.notifier).state = index;
                },
              ),
              items: images.map((path) {
                return Image.asset(
                  path,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          /// Animated Indicator Dots (Riverpod Controlled)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: currentIndex == index ? 20 : 8,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Colors.black
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),

          // sub banners
          AppSubBanners(),
        ],
      ),
    );
  }
}
