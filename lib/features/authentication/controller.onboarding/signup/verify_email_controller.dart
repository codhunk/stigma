import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stigma/common/widgets/loaders/loaders.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/authentication/screens/signup/successscreen.dart';
import 'package:stigma/utils/constants/textstring.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //// Send Email Whenever Verify Screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your email to verify your account.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Timer for auto redirect to login screen

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen1(
            image: 'assets/animation/success.json',
            title: TText.yourAccountCreatedTitle,
            subTitle: TText.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually check the verification link

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen1(
          image: 'assets/animation/success.json',
          title: TText.yourAccountCreatedTitle,
          subTitle: TText.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
