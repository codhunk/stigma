
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/widgets/appbar/appbar.dart';
import 'package:stigma/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:stigma/features/branch/screens/home/widgets/TSearchWidget.dart';
import 'package:stigma/features/branch/screens/home/widgets/cardwidget.dart';
import 'package:stigma/features/branch/screens/home/widgets/discountCardWidget.dart';
import 'package:stigma/features/branch/screens/home/widgets/shipmenthistory.dart';
import 'package:stigma/features/personalization/controllers/user.controller.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonPrimary,
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 25),
                TAppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Call your function to pick and upload photo here
                              controller.pickAndUploadPhoto();
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  dark
                                      ? AssetImage(AppImages.darkprofile)
                                      : AssetImage(AppImages.lightprofile),
                            ),
                          ),

                          SizedBox(width: 15),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TText.welcomeTitle,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.apply(
                                  color: AppColors.black,
                                  fontWeightDelta: DateTime.july,
                                ),
                              ),
                              SizedBox(height: 3),
                              Obx(() {
                                if (controller.profileLoading.value) {
                                  return const TShimmerEffect(
                                    width: 120,
                                    height: 18,
                                    radius: 5,
                                  );
                                } else {
                                  return Text(
                                    controller.user.value.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: AppColors.black),
                                  );
                                }
                              }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSearchHomeWidget(),
                const SizedBox(height: TSizes.spaceBtwSections),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                    ), // Adjust the left padding
                    child: Text(
                      TText.shipmentHeading,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: dark ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TShipmentHistoryWidgets(),
                const SizedBox(height: TSizes.spaceBtwSections),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                    ), // Adjust the left padding
                    child: Text(
                      TText.stayConnected,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                CustomCardWidgets(),
                const SizedBox(height: TSizes.spaceBtwSections),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 32.0,
                    ), // Adjust the left padding
                    child: Text(
                      TText.bestOffer,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                DiscountCard(),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
