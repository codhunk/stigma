import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TeacherStatusScreen extends StatefulWidget {
  @override
  _TeacherStatusScreenState createState() => _TeacherStatusScreenState();
}

class _TeacherStatusScreenState extends State<TeacherStatusScreen> {
  int _selectedTabIndex = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  final List<Map<String, dynamic>> students = [
    {
      "name": "Ethan Harper",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": false,
    },
    {
      "name": "Olivia Bennett",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Noah Carter",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Ava Thompson",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": false,
    },
    {
      "name": "Liam Foster",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": false,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
    {
      "name": "Isabella Reed",
      "subject": "Math",
      "image": "assets/images/jalandhar_raur.jpg",
      "present": true,
    },
  ];

  void _toggleAttendance(int index, bool value) {
    setState(() {
      students[index]['present'] = value;
    });
  }

  void _submitAttendance() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Attendance submitted successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Row(
            children: [
              _buildTabButton("Daily", 0),
              _buildTabButton("Weekly", 1),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCalendar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Class 10A",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              itemCount: students.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final student = students[index];
                return _buildStudentTile(
                  name: student['name'],
                  subject: student['subject'],
                  imagePath: student['image'],
                  isPresent: student['present'],
                  onChanged: (val) => _toggleAttendance(index, val),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: _submitAttendance,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF5A49E3),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text("Submit Attendance", style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: isSelected ? Colors.black : Colors.transparent,
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          selectedDecoration: BoxDecoration(
            color: Color(0xFF5A49E3),
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStudentTile({
    required String name,
    required String subject,
    required String imagePath,
    required bool isPresent,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: AssetImage(imagePath)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(subject, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Switch(
            value: isPresent,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Color(0xFF5A49E3),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
