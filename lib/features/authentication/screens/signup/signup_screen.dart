import 'package:stigma/common/spacing_style.dart';
import 'package:stigma/features/authentication/screens/login/login_screen.dart';
import 'package:stigma/features/authentication/screens/signup/signup_form.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections * 1.5),
                  // Row(
                  //   children: [
                  //     Image(
                  //       image: AssetImage(
                  //         dark ? AppImages.darkAppLogo : AppImages.lightAppLogo,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: TSizes.spaceBtwItems),
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
              TSignupForm(),

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
                    TText.orSignUpWith,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   onPressed: () {},
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
              const SizedBox(height: TSizes.spaceBtwSections * 1.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: TText.haveAccount, // "Start your Journey with "
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: TText.signIn, // "Apna Parcel"
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.buttonPrimary,
                          fontWeight: FontWeight.bold, // Optional for emphasis
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
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
    );
  }
}
