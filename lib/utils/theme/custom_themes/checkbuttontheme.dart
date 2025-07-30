import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class AppCheckBoxTheme {
  AppCheckBoxTheme._();
  static CheckboxThemeData lightAppCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.buttonPrimary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkAppCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.buttonPrimary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
