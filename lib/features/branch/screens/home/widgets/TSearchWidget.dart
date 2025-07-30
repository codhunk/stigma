
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';

class TSearchHomeWidget extends StatelessWidget {
  const TSearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 65,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                // Icon(Iconsax.search_normal, color: AppColors.darkGrey),
                SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.spatial_tracking),
                      prefixIconColor: AppColors.borderSecondary,
                      labelText: TText.trackingNumber,
                    ),
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: const Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ).withOpacity(0.8),
                   
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.borderSecondary,
                  child: Icon(
                    Iconsax.scan_barcode,
                    color: Colors.white,
                    size: 24,
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
