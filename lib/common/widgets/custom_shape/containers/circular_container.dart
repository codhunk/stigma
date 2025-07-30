import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.backgroundColor = AppColors.white,
    this.padding = 0,
    this.radius = 400,
    this.child,
  });
  final double? height;
  final double? width;
  final Color backgroundColor;
  final double radius;
  final Widget? child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: AppColors.white.withOpacity(0.2),
      ),
    );
  }
}
