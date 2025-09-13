import 'package:flutter/material.dart';

class ContainerBuilder {
  static Widget buildFlexContainer({
    BorderRadius? borderRadius,
    Border? border,
    double? height,
    Gradient? gradient,
    double? width,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
