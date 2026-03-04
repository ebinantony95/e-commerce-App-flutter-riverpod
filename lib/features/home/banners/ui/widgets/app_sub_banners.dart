import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';

class AppSubBanners extends StatelessWidget {
  const AppSubBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .50,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(Myimages.subBanner1, fit: BoxFit.cover),
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * .20,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(Myimages.subBanner2, fit: BoxFit.cover),
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * .20,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(Myimages.subBanner3, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
