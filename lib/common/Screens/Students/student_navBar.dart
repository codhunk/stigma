import 'package:flutter/material.dart';

class StudentNavigationBar extends StatefulWidget {
  @override
  _StudentNavigationBarState createState() => _StudentNavigationBarState();
}

class _StudentNavigationBarState extends State<StudentNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home")),
    Center(child: Text("Fees")),
    Center(child: Text("Results")),
    Center(child: Text("Profile")),
    Center(child: Text("Messages")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Fees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
