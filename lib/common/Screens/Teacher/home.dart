import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:stigma/common/Screens/Teacher/assignment.dart';
import 'package:stigma/common/Screens/Teacher/message.dart';
import 'package:stigma/common/Screens/Teacher/profile.dart';
import 'package:stigma/common/Screens/Teacher/status.dart';
import 'package:stigma/common/Screens/Teacher/student.dart';
import 'package:stigma/common/Screens/Teacher/teacher_assignment.dart';
import 'package:stigma/common/Screens/Teacher/teacher_grade_entery.dart';

class TeacherHomeScreen extends StatelessWidget {
  final primaryColor = Colors.deepPurple;

  TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            // 🌈 Header with Gradient
            Container(
              width: double.infinity,

              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ), // reduced from 45 to 20
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Color(0xFF7E57C2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Prof. Davis",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "thompson.math@sunrise.edu",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "ID: MTH20245",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            // 📋 Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.dashboard,
                    label: "Dashboard",
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.person,
                    label: "Students",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => StudentsScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.analytics,
                    label: "Messages",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TeacherMessagesScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.assignment,
                    label: "Status",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TeacherStatusScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.settings,
                    label: "Settings",
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TeacherProfileScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.assessment,
                    label: "Assignments",
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AssignmentScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🚪 Logout Section
            Divider(),
            _buildDrawerItem(
              context: context,
              icon: Icons.logout,
              label: "Logout",
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Logged out")));
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),

      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherProfileScreen());
              },
              child: const Text(
                "Hello, Prof. Davis",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 37, 57, 137),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor.withOpacity(0.1),
                  child: Icon(Icons.school, color: Colors.deepPurple),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sunrise School",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "thompson.math@sunrise.edu",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              children: [
                _infoCard(
                  "Students",
                  "120",
                  Icons.group,
                  onTap: () {
                    Get.to(
                      () => StudentsScreen(),
                    ); // Navigate to StudentsScreen
                  },
                ),
                SizedBox(width: 16),
                _infoCard(
                  "Upcoming",
                  "4",
                  Icons.class_,
                  onTap: () {
                    Get.to(
                      () => StudentsScreen(),
                    ); // Navigate to StudentsScreen
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "58%",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "+3.4%",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text("21 Apr, 19:59", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 12),

                  SizedBox(
                    height: 80,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        minX: 0,
                        maxX: 12,
                        minY: 0,
                        maxY: 5,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 4),
                              FlSpot(1, 2),
                              FlSpot(2, 2.5),
                              FlSpot(3, 2.2),
                              FlSpot(4, 2.8),
                              FlSpot(5, 3.5),
                              FlSpot(6, 2.9),
                              FlSpot(7, 4.4),
                              FlSpot(8, 3.0),
                              FlSpot(9, 3.6),
                              FlSpot(10, 3.3),
                              FlSpot(11, 2.7),
                              FlSpot(12, 2.0),
                            ],
                            isCurved: true,
                            color: Colors.deepPurple,
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.deepPurple.withOpacity(0.15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Recent Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _activityItem(
              Icons.assignment_outlined,
              "Assignments",
              "10 new submissions",
              onTap: () => Get.to(() => TeacherAssignAssignmentScreen()),
            ),
            _activityItem(
              Icons.mail_outline,
              "Messages",
              "2 unread messages",
              onTap: () => Get.to(() => TeacherMessagesScreen()),
            ),
            _activityItem(
              Icons.calendar_month_outlined,
              "Attendance",
              "3 attendance alerts",
              onTap: () => Get.to(() => TeacherStatusScreen()),
            ),

            SizedBox(height: 30),
            Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => TeacherGradeEntryScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Enter Grades"),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => TeacherStatusScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      side: BorderSide(color: primaryColor),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Mark Attendance",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarScreen(),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   selectedItemColor: primaryColor,
      //   unselectedItemColor: Colors.grey,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.group), label: "Students"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail_outline),
      //       label: "Messages",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Status"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: "Profile",

      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = Colors.deepPurple,
    Color textColor = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      horizontalTitleGap: 14,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }

  static Widget _infoCard(
    String title,
    String count,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 28),
              SizedBox(height: 10),
              Text(
                count,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(title, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _activityItem(
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurple.withOpacity(0.1),
        child: Icon(icon, color: Colors.deepPurple),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
