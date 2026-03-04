import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/styles/dark_overlay.dart';
import 'package:sneakcom_ecom/features/onboarding/onboarding_pages/core/screen_controllers/onboarding_controller.dart';
import 'package:sneakcom_ecom/features/onboarding/onboarding_pages/core/model/onboarding_model.dart';
import 'package:sneakcom_ecom/util/constants/sizes.dart';

class OnboaringScreen extends ConsumerWidget {
  OnboaringScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingProver);

    ref.listen(onboardingProver, (prev, next) {
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              ref.read(onboardingProver.notifier).setPage(index);
            },

            itemBuilder: (context, index) {
              final data = onboardingPages[index];
              return Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(data.image, fit: BoxFit.cover),
                  ), // Dark Overlay
                  DarkOverlay(),

                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            // logo...................
                            SizedBox(
                              width: MediaQuery.of(context).size.width,

                              child: Image.asset(
                                data.logo,
                                width: 361,
                                height: 361,
                              ),
                            ),
                            // heading and sub heading....
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //heading
                                Text(
                                  textAlign: TextAlign.left,
                                  data.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(height: 25),

                                // subheading
                                Text(
                                  textAlign: TextAlign.left,
                                  data.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: AppSizes.navBarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // next button............
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (currentPage == onboardingPages.length - 1) {
                                context.goNamed('getStarted');
                              } else {
                                ref
                                    .read(onboardingProver.notifier)
                                    .nextPage(onboardingPages.length);
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // skip button............
                        Container(
                          width: 92,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.goNamed('getStarted');
                            },
                            child: Text(
                              currentPage == onboardingPages.length - 1
                                  ? 'LetsGo'
                                  : 'Skip',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
