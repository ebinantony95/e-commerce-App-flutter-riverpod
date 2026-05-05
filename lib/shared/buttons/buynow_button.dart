import 'package:flutter/material.dart';

class BuynowButton extends StatelessWidget {
  final VoidCallback onpressed;
  const BuynowButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),

      width: 40,
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          'Buy Now',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
