import 'package:flutter/material.dart';

class MyElevatedbuttontheme {
  MyElevatedbuttontheme._();

  // dark elevated button

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  // light elevated button theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
