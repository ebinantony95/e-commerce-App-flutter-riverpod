import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';
import 'package:sneakcom_ecom/util/constants/images.dart';

void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // can't close by tapping outside
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Success Image
              Image.asset(
                Myimages.logoRedpart, // your asset path
                height: 120,
              ),

              const SizedBox(height: 20),
              const Text(
                "Your Payment Is Successful",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Remove all previous routes and go to home
                    context.goNamed('home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.addCartColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Back To Shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
