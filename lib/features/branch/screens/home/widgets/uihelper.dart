import 'package:flutter/material.dart';

class UiHelper {
  // Custom Image Widget
  static Widget customImage(String img) =>
      Image.asset("assets/images/$img", height: 84.0, width: 339.0);
  static Widget CustomImage(String img) =>
      Image.asset("assets/images/$img", fit: BoxFit.contain);
}
