import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/common/styles/dark_overlay.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';
import 'package:sneakcom_ecom/util/constants/sizes.dart';
import 'package:sneakcom_ecom/util/constants/text_strings.dart';
import 'package:sneakcom_ecom/util/helpers/helpers.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = Helpers.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          // background image
          Positioned.fill(
            child: Image.asset(
              isdark ? Myimages.getStartedDark : Myimages.getStartedLight,
              fit: BoxFit.cover,
            ),
          ),
          // dark overlay
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
                        Myimages.darkLogo,
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
                          Textstrings.onboardingTitle3,
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 25),

                        // subheading
                        Text(
                          textAlign: TextAlign.left,
                          Textstrings.onboardingSubTitle3,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    // get started button
                    Positioned(
                      bottom: AppSizes.navBarHeight,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ElevatedButton(
                          onPressed: () {
                            context.goNamed('login');
                          },
                          child: Text(
                            Textstrings.geStarted,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
