import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:stigma/common/spacing_style.dart';
import 'package:stigma/features/authentication/controller.onboarding/login_controller/login_controller.dart';
import 'package:stigma/features/authentication/screens/login/loginform.dart';
import 'package:stigma/features/authentication/screens/signup/signup_screen.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                    // Row(
                    //   children: [
                    //     Image(
                    //       image: AssetImage(
                    //         dark ? AppImages.darkAppLogo : AppImages.lightAppLogo,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    Text(
                      TText.loginTitle,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      TText.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                ///Form
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TLoginForm(),
                    const SizedBox(height: TSizes.spaceBtwSections * 0.8),
                  ],
                ),

                ///Divider
                const SizedBox(height: TSizes.spaceBtwSections * 0.8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: dark ? AppColors.darkGrey : AppColors.grey,
                        thickness: 0.8,
                        indent: 60,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      TText.orSignInWith,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Flexible(
                      child: Divider(
                        color: dark ? AppColors.darkGrey : AppColors.grey,
                        thickness: 0.8,
                        indent: 5,
                        endIndent: 60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 1.0),

                ///Footer
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(TSizes.buttonRadius),
                          backgroundColor: const Color.fromARGB(
                            255,
                            230,
                            230,
                            230,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        onPressed: () => controller.googleSignIn(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TText.logInWithGoogle,
                              style: TextStyle(color: Colors.black26),
                            ),
                            SizedBox(width: 8),
                            Image.asset(
                              'assets/icons/brands/Google.png', // Make sure this path is correct and added in pubspec.yaml
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () => controller.googleSignIn(),
                    //   icon: const Image(
                    //     width: TSizes.iconLg,
                    //     image: AssetImage(AppImages.google),
                    //   ),
                    // ),
                    // const SizedBox(width: TSizes.spaceBtwIcons),

                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Image(
                    //     width: TSizes.iconLg,
                    //     image: AssetImage(AppImages.facebook),
                    //   ),
                    // ),

                    // const SizedBox(width: TSizes.spaceBtwIcons),

                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Image(
                    //     width: TSizes.iconLg,
                    //     image: AssetImage(AppImages.twitter),
                    //   ),
                    // ),

                    // const SizedBox(width: TSizes.spaceBtwIcons),

                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Image(
                    //     width: TSizes.iconLg,
                    //     image: AssetImage(AppImages.apple),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: TText.newUser, // "Start your Journey with "
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: TText.createAccount, // "Apna Parcel"
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Color(0xff800020),
                            fontWeight:
                                FontWeight.bold, // Optional for emphasis
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
