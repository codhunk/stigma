import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stigma/common/Screens/Teacher/home.dart';
import 'package:stigma/common/Screens/Teacher/message.dart';
import 'package:stigma/common/Screens/Teacher/profile.dart';
import 'package:stigma/common/Screens/Teacher/status.dart';
import 'package:stigma/common/Screens/Teacher/teacherscreen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    TeacherHomeScreen(), // replace with your actual Home screen
    TeacherScreen(), // replace with your actual Students screen
    TeacherMessagesScreen(), // replace with your actual Messages screen
    TeacherStatusScreen(), // replace with your actual Status screen
    TeacherProfileScreen(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
