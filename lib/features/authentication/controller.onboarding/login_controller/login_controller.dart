import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stigma/common/widgets/loaders/loaders.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/personalization/controllers/user.controller.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/helpers/network_manager.dart';
import 'package:stigma/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  //   Variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final studentID = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    studentID.text = localStorage.read('REMEMBER_ME_STUDENT_ID') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //--------- Email and Password signin ---------
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Logging...",
        "assets/animation/success.json",
      );

      //-------Check Internet Connectivity----------
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar(
          'No Internet Connection',
          'Please check your internet connection and try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      //-------------Form Validation----------------
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //-------Save Data if Remember Me is selected----------
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_STUDENT_ID', studentID.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //-------Login user using Email & Password Authentication----------
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
            studentID.text.trim(),
            password.text.trim(),
          );

      //-------Remove Loader----------
      TFullScreenLoader.stopLoading();

      //-------Redirect----------
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap..', message: e.toString());
    }
  }

  //--------- Google SignIn Authentication ---------
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        AppImages.loadingAnimation,
      );
      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication

      final userCredentials =
          await AuthenticationRepository.instance.signinWithGoogle();
      //Save User Record
      await userController.saveUserRecord(userCredentials);
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Google Sign-In Failed',
        message: e.toString(),
      );
    }
  }
}
