import 'package:flutter/material.dart';
import 'package:stigma/common/Screens/Teacher/home.dart';
import 'package:stigma/common/Screens/Teacher/message.dart';
import 'package:stigma/common/Screens/Teacher/profile.dart';
import 'package:stigma/common/Screens/Teacher/status.dart';
import 'package:stigma/common/Screens/Teacher/student.dart';

class NavigationBarUI extends StatefulWidget {
  @override
  _NavigationBarUIState createState() => _NavigationBarUIState();
}

class _NavigationBarUIState extends State<NavigationBarUI> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TeacherHomeScreen(),
    StudentsScreen(),
    TeacherMessagesScreen(),
    TeacherStatusScreen(),
    TeacherProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 75, // 👈 Increased height
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14, // 👈 slightly increased
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          iconSize: 28, // 👈 increased icon size
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Students"),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
