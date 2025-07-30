
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/device/device_utility.dart';

class TSearchWidget extends StatelessWidget {
  const TSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: Border.all(color: AppColors.grey, width: 1),
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: AppColors.darkGrey),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Search delivery location',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
