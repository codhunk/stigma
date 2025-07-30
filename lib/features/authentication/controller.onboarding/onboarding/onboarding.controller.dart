import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stigma/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variable
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
  // Update Current Index when page scroll
  void updatePageIndicator(index) => currentIndex.value = index;

  /// Jupm to the specific dot selected Page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('========GET STORAGE=========');
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);

      if (kDebugMode) {
        print('========GET STORAGE=========');
        print(storage.read('isFirstTime'));
      }

      Get.offAll(LoginScreen());
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last page
  void skipPage() {}
}
