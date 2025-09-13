import 'package:flutter/material.dart';
import 'package:stigma/common/Screens/Teacher/message.dart';
import 'package:stigma/common/Screens/Teacher/profile.dart';
import 'package:stigma/common/Screens/Teacher/status.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 🌟 Drawer Header
          Container(
            width: double.infinity,
            // padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            // colors: [Colors.deepPurple, Color(0xFF7E57C2)],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 36, color: Colors.deepPurple),
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
              ],
            ),
          ),

          // 📋 Menu List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  icon: Icons.dashboard_outlined,
                  label: "Dashboard",
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  icon: Icons.analytics_outlined,
                  label: "Statistics",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TeacherStatusScreen()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  label: "Settings",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TeacherProfileScreen()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  label: "Results",
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
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
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
              ],
            ),
          ),

          // 🚪 Logout button
          Column(
            children: [
              Divider(),
              _buildDrawerItem(
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
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    Color? iconColor,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.deepPurple),
      title: Text(
        label,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 12,
      dense: true,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
