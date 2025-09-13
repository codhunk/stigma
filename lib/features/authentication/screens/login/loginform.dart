import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Screens/Teacher/home.dart';
import 'package:stigma/features/authentication/controller.onboarding/login_controller/login_controller.dart';
import 'package:stigma/features/authentication/screens/password_configration/forgetpassword.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/sizes.dart';
import 'package:stigma/utils/constants/textstring.dart';
import 'package:stigma/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.school),
                prefixIconColor: AppColors.borderSecondary,
                labelText: TText.schoolCode,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // -------------Student ID--------------
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.badge),
                prefixIconColor: AppColors.borderSecondary,
                labelText: TText.studentID,
              ),
            ),
            //-------------Password--------------
            const SizedBox(height: TSizes.spaceBtwinputFields),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: AppColors.borderSecondary,
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
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),
                    const Text(TText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: const Text(
                    TText.forgotPasswordTitle,
                    style: TextStyle(fontSize: 14, color: Color(0xff000000)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // -------------Signin Button--------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => TeacherHomeScreen()),
                child: const Text(
                  TText.logIn,
                  style: TextStyle(color: AppColors.buttonSecondary),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // -------------Signin Button--------------
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () => controller.emailAndPasswordSignIn(),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           TText.logInWithGoogle,
            //           style: TextStyle(color: AppColors.buttonDisabled),
            //         ),
            //         SizedBox(width: 8),
            //         Image.asset(
            //           'assets/icons/brands/Google.png', // Make sure this path is correct and added in pubspec.yaml
            //           height: 24,
            //           width: 24,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
