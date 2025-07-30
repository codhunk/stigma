
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stigma/common/widgets/loaders/loaders.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/authentication/screens/password_configration/resetpassword.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/helpers/network_manager.dart';
import 'package:stigma/utils/popups/full_screen_loader.dart' show TFullScreenLoader;

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        AppImages.loadingAnimation,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Send Email to Rest Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link Sent to Reset your Password'.tr,
      );
      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        AppImages.loadingAnimation,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Send Email to Rest Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link Sent to Reset your Password'.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
