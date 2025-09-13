import 'package:flutter/material.dart';
import 'package:stigma/common/Screens/Students/assignment_student.dart';
import 'package:stigma/common/Screens/Students/fees_screen.dart';
import 'package:stigma/common/Screens/Students/home.dart';
import 'package:stigma/common/Screens/Students/profile_screen.dart';
import 'package:stigma/common/Screens/Students/result_screen.dart';

class StudentNavigationUI extends StatefulWidget {
  @override
  _StudentNavigationUIState createState() => _StudentNavigationUIState();
}

class _StudentNavigationUIState extends State<StudentNavigationUI> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageScreen(),
    StudentFeesScreen(),
    StudentResultScreen(),
    StudentAssignmentScreen(),
    StudentProfileScreen(),
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
          backgroundColor: Color.fromARGB(255, 244, 242, 242),
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
            BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Fees"),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Results",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "Assignment",
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
