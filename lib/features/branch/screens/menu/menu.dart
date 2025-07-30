
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/widgets/appbar/appbar.dart';
import 'package:stigma/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:stigma/common/widgets/loaders/shimmer_effect_loader.dart';
import 'package:stigma/features/branch/screens/menu/widgets/widgets/TListItemsWidget.dart';
import 'package:stigma/features/personalization/controllers/user.controller.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/image_strings.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());

    return Scaffold(
      // appBar: TAppBar(title: const Text('Home Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainerWidgets(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  dark
                                      ? AssetImage(AppImages.darkprofile)
                                      : AssetImage(AppImages.lightprofile),
                            ),

                            SizedBox(
                              width: 15,
                            ), // Space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.user.value.email,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium!.apply(
                                      color:
                                          dark
                                              ? AppColors.white
                                              : AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
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
                                          .apply(color: AppColors.white),
                                    );
                                  }
                                }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle, size: 50),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // const SizedBox(height: TSizes.spaceBtwSections),
                  // TSearchWidget(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 115,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Color(0xffBE637A),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '03',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Sent',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 1,
                          color: Color(0xff800020).withOpacity(0.5),
                        ),

                        Container(
                          height: 115,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color(0xffBE637A),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '09',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Recieved',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TListItemsWidget(),
          ],
        ),
      ),
    );
  }
}
