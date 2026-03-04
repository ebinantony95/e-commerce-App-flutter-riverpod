import 'package:sneakcom_ecom/util/constants/images.dart';
import 'package:sneakcom_ecom/util/constants/text_strings.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;
  final String logo;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
    required this.logo,
  });
}

final onboardingPages = [
  OnboardingModel(
    title: Textstrings.onboardingTitle1,
    description: Textstrings.onboardingSubTitle1,
    image: Myimages.onBoardingImg1,
    logo: Myimages.darkLogo,
  ),
  OnboardingModel(
    title: Textstrings.onboardingTitle2,
    description: Textstrings.onboardingSubTitle2,
    image: Myimages.onBoardingImg2,
    logo: Myimages.darkLogo,
  ),
];
