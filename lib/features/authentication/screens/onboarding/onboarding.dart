import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: HelperFunctions.screenWidth() * 0.6,
                      height: HelperFunctions.screenHeight() * 0.15,
                      image: AssetImage(AppImages.darkAppLogo),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  TText
                                      .onBoardingTitle1, // "Start your Journey with "
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            TextSpan(
                              text: TText.onBoardingTitle11, // "Apna Parcel"
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(color: Color(0xff800020)),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
