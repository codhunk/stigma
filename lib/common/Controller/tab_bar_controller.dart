import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControllerGetx extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  RxInt currentIndex = 0.obs;

  final List<Tab> tabs = const [
    Tab(text: 'Semester 1'),
    Tab(text: 'Semester 2'),
    Tab(text: 'Semester 3'),
    Tab(text: 'Semester 4'),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
