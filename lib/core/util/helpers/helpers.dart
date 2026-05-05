import 'package:flutter/material.dart';

class Helpers {
  /// Checks if the current app theme is dark
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
