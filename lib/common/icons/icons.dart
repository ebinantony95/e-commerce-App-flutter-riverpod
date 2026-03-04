import 'package:flutter/material.dart';

class Appicons extends StatelessWidget {
  const Appicons({
    super.key,
    required this.iconsize,
    this.onpressed,
    required this.iconName,
    required this.iconColor,
  });
  final double iconsize;
  final VoidCallback? onpressed;
  final IconData iconName;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconsize,
      onPressed: onpressed,
      icon: Icon(iconName, color: iconColor),
    );
  }
}
