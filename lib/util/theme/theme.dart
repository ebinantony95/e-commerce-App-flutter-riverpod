import 'package:flutter/material.dart';
import 'package:sneakcom_ecom/util/theme/custom_themes/app_navbartheme.dart';
import 'package:sneakcom_ecom/util/theme/custom_themes/app_texttheme.dart';
import 'package:sneakcom_ecom/util/theme/custom_themes/elevatedbutton_theme.dart';
import 'package:sneakcom_ecom/util/theme/custom_themes/textfirmfield_thme.dart';

class AppTheme {
  AppTheme._();

  // light theme

  static final ThemeData light = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyApptexttheme.lightTextTheme,
    elevatedButtonTheme: MyElevatedbuttontheme.lightElevatedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.light,
    bottomNavigationBarTheme: AppNavbartheme.light,
  );

  // dark theme

  static final ThemeData dark = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyApptexttheme.darkTextTheme,
    elevatedButtonTheme: MyElevatedbuttontheme.darkElevatedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.dark,
    bottomNavigationBarTheme: AppNavbartheme.dark,
  );
}
