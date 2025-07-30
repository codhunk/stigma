import 'package:stigma/features/authentication/controller.onboarding/signup/signup_controller.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    // bool isObscured = true;
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwinputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.school),
                prefixIconColor: AppColors.borderSecondary,
                labelText: TText.schoolCode,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields),
            TextFormField(
              controller: controller.fullName,
              validator:
                  (value) => TValidator.validateEmptyText('Full Name', value),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                prefixIconColor: AppColors.buttonPrimary,
                labelText: TText.fullName,
                errorBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call),
                prefixIconColor: AppColors.buttonPrimary,
                labelText: TText.phoneNo,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwinputFields),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.badge),
                prefixIconColor: AppColors.buttonPrimary,
                labelText: TText.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: AppColors.buttonPrimary,
                  suffixIconColor: AppColors.buttonPrimary,
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  labelText: TText.password,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TText.rememberMe),
                  ],
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(
                  TText.signUp,
                  style: TextStyle(color: AppColors.buttonSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
