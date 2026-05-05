import 'package:flutter/material.dart';

class HeadingWithViewAll extends StatelessWidget {
  final String heading;
  final String subHeading;
  final Color color;
  final VoidCallback onpressed;
  const HeadingWithViewAll({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.color,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: color),
          ),
          TextButton(
            onPressed: onpressed,
            child: Text(
              subHeading,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
