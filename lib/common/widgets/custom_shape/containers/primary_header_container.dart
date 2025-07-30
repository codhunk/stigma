
import 'package:flutter/material.dart';
import 'package:stigma/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:stigma/common/widgets/custom_shape/curved_edges/curved_edges_widgets.dart';
import 'package:stigma/utils/constants/colors.dart';

class TPrimaryHeaderContainerWidgets extends StatelessWidget {
  const TPrimaryHeaderContainerWidgets({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidgets(
      child: Container(
        color: AppColors.borderSecondary,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 340,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: AppColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: AppColors.white.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
