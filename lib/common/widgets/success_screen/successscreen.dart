import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/spacing_style.dart';
import 'package:stigma/features/authentication/screens/login/login_screen.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required String title,
    required String subTitle,
    required Function() onPressed,
    required String image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              /// Logo
              Image(
                image: AssetImage(AppImages.verifyEmailPic),
                width: HelperFunctions.screenWidth() * 0.6,
              ),

              /// Title and Subtitle
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TText.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TText.yourAccountCreatedSubTitle,
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
                    TText.tContinue,
                    style: TextStyle(color: Colors.white),
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
