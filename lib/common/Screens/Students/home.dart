import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stigma/common/Screens/Students/fees_screen.dart';
import 'package:stigma/common/Screens/Students/payfees.dart';
import 'package:stigma/common/Screens/Students/profile_screen.dart';
import 'package:stigma/common/Screens/Students/result_screen.dart';
import 'package:stigma/common/Screens/Teacher/assignment.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              "Hello, John",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(height: 12),

            // School info
            _buildSchoolInfo(),

            SizedBox(height: 20),

            // Stats Cards
            Row(
              children: [
                Expanded(child: _buildInfoCard("Students", "120")),
                SizedBox(width: 12),
                Expanded(child: _buildInfoCard("Upcoming Classes", "4")),
              ],
            ),
            SizedBox(height: 16),

            // Graph Card
            _buildGraphCard(),

            SizedBox(height: 16),

            // Fee Status
            _buildFeeStatus(context),

            SizedBox(height: 16),

            // Latest Results
            _buildLatestResults(),

            SizedBox(height: 16),

            // Schedule
            Text(
              "Today's Schedule",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            _buildScheduleItem(
              Icons.calculate,
              "Math Class",
              "9:00 AM - 10:00 AM",
            ),
            _buildScheduleItem(
              Icons.restaurant_menu,
              "Lunch Break",
              "12:00 PM - 1:00 PM",
            ),
            _buildScheduleItem(
              Icons.science,
              "Physics Lab",
              "2:00 PM - 4:00 PM",
            ),

            SizedBox(height: 16),

            // Quick Access
            Text(
              "Quick Access",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _QuickAccessTile(icon: Icons.person, title: "Profile"),
                _QuickAccessTile(
                  icon: Icons.calendar_today,
                  title: "Timetable",
                ),
                _QuickAccessTile(icon: Icons.message, title: "Messages"),
                _QuickAccessTile(icon: Icons.badge, title: "ID Card"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- DRAWER -------------------
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Color(0xFF7E57C2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 36, color: Colors.deepPurple),
                ),
                SizedBox(height: 12),
                Text(
                  "John Miller",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "john.miller@sunrise.edu",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  "Stu.ID: MTH20245",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 16),
                _buildDrawerItem(
                  context,
                  Icons.dashboard,
                  "Dashboard",
                  () => Navigator.pop(context),
                ),
                _buildDrawerItem(context, Icons.person, "Results", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StudentResultScreen()),
                  );
                }),
                _buildDrawerItem(context, Icons.analytics, "Assignments", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AssignmentScreen()),
                  );
                }),
                _buildDrawerItem(context, Icons.assignment, "Fees", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StudentFeesScreen()),
                  );
                }),
                _buildDrawerItem(context, Icons.settings, "Settings", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StudentProfileScreen()),
                  );
                }),
              ],
            ),
          ),
          Divider(),
          _buildDrawerItem(
            context,
            Icons.logout,
            "Logout",
            () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Logged out")));
            },
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // ------------------- SCHOOL INFO -------------------
  Widget _buildSchoolInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.school, size: 28),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Sunrise School",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, size: 18, color: Colors.orange),
              ],
            ),
            Text(
              "sunriseschools@sunrise.edu",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // ------------------- INFO CARD -------------------
  static Widget _buildInfoCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // ------------------- GRAPH -------------------
  Widget _buildGraphCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "58%",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                        color: Colors.deepPurple.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- FEE STATUS -------------------
  Widget _buildFeeStatus(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fee Status",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text("Amount Due: ₹31,105"),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentScreen()),
                );
              },
              child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xFF6241CD),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- LATEST RESULTS -------------------
  Widget _buildLatestResults() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Latest Results",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text("GPA: 3.8"),
              ],
            ),
            Text(
              "View Details",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- SCHEDULE ITEM -------------------
  static Widget _buildScheduleItem(IconData icon, String title, String time) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(time),
    );
  }
}

// ------------------- QUICK ACCESS TILE -------------------z
// ------------------- QUICK ACCESS TILE -------------------
class _QuickAccessTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  _QuickAccessTile({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {}, // Allow optional navigation
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6241CD), Color(0xFF947DFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(16),
              child: Icon(icon, size: 28, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------- DRAWER ITEM -------------------
Widget _buildDrawerItem(
  BuildContext context,
  IconData icon,
  String label,
  VoidCallback onTap, {
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
