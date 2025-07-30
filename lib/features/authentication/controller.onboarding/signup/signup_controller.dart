import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stigma/common/widgets/loaders/loaders.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/data/repositories.authentication/user/user_repository.dart';
import 'package:stigma/features/authentication/models/user_model/user_model.dart';
import 'package:stigma/features/authentication/screens/signup/verifyemail.dart';
import 'package:stigma/utils/helpers/network_manager.dart';
import 'package:stigma/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController instance = Get.find();

  // Variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final profilePicture = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // -----SignUp-----
  void signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Creating Account",
        "assets/animation/loading.json",
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Remember Me

      // Register User in the firebase Authentication & Save the data in the firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authentication user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        fullName: fullName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        password: password.text.trim(),
        profilePicture: '',
      );

      // Save User data in the firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecords(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: "Success",
        message: "Account Created Successfully",
      );

      // Clear the form fields
      // email.clear();
      // password.clear();
      // confirmPassword.clear();
      // fullName.clear();
      // phoneNumber.clear();

      // Redirect to the login screen
      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
