
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/features/authentication/screens/login/login_screen.dart';
import 'package:stigma/features/authentication/controller.onboarding/forget_password/forget_password_controller.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImages.verifyEmailPic),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TText.tResetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TText.tResetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              /// Button
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => LoginScreen()),
                  child: const Text(
                    TText.tDone,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed:
                      () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                  child: const Text(
                    TText.resendEmail,
                    style: TextStyle(
                      color: AppColors.borderSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
