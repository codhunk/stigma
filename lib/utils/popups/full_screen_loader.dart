
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stigma/common/widgets/loaders/animation_loader.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color:
                  HelperFunctions.isDarkMode(Get.context!)
                      ? AppColors.dark
                      : AppColors.white,
              width: double.infinity,
              height: double.infinity,

              child: Column(
                children: [
                  const SizedBox(height: 250),
                  TAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          ),
    );
  }
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
