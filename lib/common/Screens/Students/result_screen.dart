import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Components/halfYearly.dart';
import 'package:stigma/common/Components/quizResult.dart';
import 'package:stigma/common/Components/sessional1Result.dart';
import 'package:stigma/common/Components/sessional2Result.dart';
import 'package:stigma/common/Components/yearlyResult.dart';
import 'package:stigma/common/Controller/bottom_nav_controller.dart';

class TabControllerGetx extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> tabs = const [
    Tab(text: "Quiz"),
    Tab(text: "Sessional 1"),
    Tab(text: "Half-Yearly"),
    Tab(text: "Sessional 2"),
    Tab(text: "Yearly"),
  ];

  void setTabCount(int count) {
    tabController = TabController(length: count, vsync: this);
  }

  @override
  void onInit() {
    super.onInit();
    setTabCount(tabs.length); // Initialize with default length
  }
}

class StudentResultScreen extends StatelessWidget {
  StudentResultScreen({super.key});

  final TabControllerGetx tabx = Get.put(TabControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavController>().changePage(0);
          },
          icon: Icon(Icons.arrow_back),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: Transform.translate(
            offset: Offset(-25, 0),
            child: TabBar(
              controller: tabx.tabController,
              tabs: tabx.tabs,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelPadding: EdgeInsets.only(right: 22),
              indicatorPadding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabx.tabController,
        children: const [
          QuizResultContent(),
          Sessional1Result(),
          HalfYearlyResultContent(),
          Sessional2Result(),
          YearlyResultContent(),
        ],
      ),
    );
  }
}
