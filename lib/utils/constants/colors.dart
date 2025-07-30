import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Text Colors
  static const Color texPrimaryColor = Color(0xff554FBB);
  static const Color textSecondaryColor = Color(0xff554FBB);
  static const Color textWhite = Colors.white;

  // Gradient colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xff554FBB), Color(0xff554FBB), Color(0xff554FBB)],
  );

  // Background colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  // Background Container Colors
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = AppColors.textWhite;

  // Button Colors
  static const Color buttonPrimary = Color(0xff554FBB);
  static const Color buttonSecondary = Color(0xffffffff);
  static const Color buttonDisabled = Colors.white;

  // Border Colors
  static const Color borderPrimary = Colors.grey;
  static const Color borderSecondary = Color(0xff554FBB);

  // Error and Validation Colors
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976D2);

  // Neutral Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
