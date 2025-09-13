
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/bindings/general_bindings.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stigma',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: AppColors.borderSecondary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
