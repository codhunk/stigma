import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Components/app_bar.dart';
import 'package:stigma/common/Components/buttons.dart';
import 'package:stigma/common/Components/container.dart';
import 'package:stigma/common/Controller/bottom_nav_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 82, 82),
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          // Wrap BottomNavigationBar in a Container
          height: 90.0, // Set your desired height for the navigation bar
          color: Color.fromARGB(255, 64, 51, 205), // Match background color
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            selectedItemColor: Colors.white, // Color for the selected item
            unselectedItemColor: Colors.grey, // Color for unselected items
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            // The background color of the BottomNavigationBar should typically be transparent
            // if its parent Container is handling the background color
            backgroundColor: Color.fromARGB(39, 0, 0, 0),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home), // Filled icon for active state
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money_off_outlined),
                activeIcon: Icon(Icons.money_off),
                label: 'Fees',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_membership_outlined),
                activeIcon: Icon(Icons.card_membership),
                label: 'Results',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                activeIcon: Icon(Icons.person_2),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                activeIcon: Icon(Icons.message),
                label: 'Messages',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarHelper.customAppBar(
        title: "Dashboard",
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                child: Text(
                  "Hello, John",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 234, 233, 233),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Icon(Icons.sunny_snowing)),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Sunrise School ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.verified,
                                color: Color.fromARGB(255, 225, 163, 81),
                                size: 15,
                              ),
                            ],
                          ),
                          Text(
                            "sunriseschools@sunrise.edu",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.35,
                    child: ContainerBuilder.buildFlexContainer(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 234, 233, 233),
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Color.fromARGB(255, 229, 220, 244),
                        ],
                      ),
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Students",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "120",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.51,
                    child: ContainerBuilder.buildFlexContainer(
                      height: 100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 234, 233, 233),
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Color.fromARGB(255, 229, 220, 244),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upcoming Classes",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ContainerBuilder.buildFlexContainer(
                borderRadius: BorderRadius.circular(10),
                height: 80,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 241, 239, 239),
                    Color.fromARGB(255, 216, 210, 226),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Announcements",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ContainerBuilder.buildFlexContainer(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 234, 233, 233),
                  width: 2,
                ),
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 10,
                    top: 8,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fee Status",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Amount due: ₹ 31,105"),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Buttons.button(
                                height: 25,
                                width: 100,
                                text: "Pay Now",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/fees_image.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ContainerBuilder.buildFlexContainer(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 234, 233, 233),
                  width: 2,
                ),
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 10,
                    top: 8,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Latest Result",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("GPA: 3.8"),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Buttons.button(
                                height: 25,
                                width: 100,
                                text: "View Details",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/result_image.jpg",

                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Text(
                  "Today's Schedule",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 170,
                  width: width,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.mobile_screen_share_outlined),
                          DottedLine(
                            direction: Axis.vertical,
                            lineLength: 40,
                            lineThickness: 1.0,
                            dashLength: 5.0,
                            dashColor: Colors.grey,
                          ),
                          Icon(Icons.free_breakfast_outlined),
                          DottedLine(
                            direction: Axis.vertical,
                            lineLength: 40,
                            lineThickness: 1.0,
                            dashLength: 5.0,
                            dashColor: Colors.grey,
                          ),
                          Icon(Icons.school_outlined),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Math Class"),
                          Text(
                            "09:00 AM - 10:00 AM",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 20),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lunch Break"),
                              Text(
                                "12:00 AM - 01:00 AM",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Physics Lab"),
                              Text(
                                "02:00 AM - 04:00 AM",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  "Quick Access",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBuilder.buildFlexContainer(
                    height: 55,
                    width: width / 2.3,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 233, 233),
                      width: 2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person_3_outlined, size: 20),
                          Text("Profile", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  ContainerBuilder.buildFlexContainer(
                    height: 55,
                    width: width / 2.3,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 233, 233),
                      width: 2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 20),
                          Text("Timetable", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBuilder.buildFlexContainer(
                    height: 55,
                    width: width / 2.3,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 233, 233),
                      width: 2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.message_outlined, size: 20),
                          Text("Messages", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  ContainerBuilder.buildFlexContainer(
                    height: 55,
                    width: width / 2.3,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 234, 233, 233),
                      width: 2,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.card_membership_outlined, size: 20),
                          Text("ID Card", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
