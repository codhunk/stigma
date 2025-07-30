import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/authentication/controller.onboarding/signup/verify_email_controller.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    // final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Example background color
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(
              CupertinoIcons.clear,
              color: Colors.black, // Ensure the icon is visible
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Removed `const`
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ), // Added `const` here
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              Image(
                image: AssetImage(AppImages.verifyEmailPic),
                width: HelperFunctions.screenWidth() * 0.6,
              ),

              /// Title and Subtitle
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TText.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(
                    TText.tContinue,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(
                    TText.resendEmail,
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69),
                      fontSize: 15,
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
