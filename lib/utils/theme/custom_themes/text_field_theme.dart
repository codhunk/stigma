import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.buttonPrimary,
    suffixIconColor: AppColors.buttonPrimary,
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(width: 1, color: AppColors.buttonPrimary),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.buttonPrimary.withOpacity(0.8),
      ),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 2, color: Colors.orange),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.buttonPrimary,
    suffixIconColor: AppColors.buttonPrimary,
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.8),
    ),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.white),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
