import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.buttonPrimary,
      foregroundColor: Colors.black, // Background color
      side: const BorderSide(color: AppColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white, // Background color
      side: const BorderSide(color: AppColors.buttonPrimary),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
