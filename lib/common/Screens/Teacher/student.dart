import 'package:flutter/material.dart';

class StudentsScreen extends StatefulWidget {
  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  String selectedClass = 'Class';
  String selectedSection = 'Section';
  String searchQuery = '';

  final List<Map<String, String>> students = [
    {
      'roll': '101',
      'name': 'Ethan Harper',
      'class': '10A',
      'image': 'assets/images/jalandhar_raur.jpg',
    },
    {
      'roll': '102',
      'name': 'Olivia Bennett',
      'class': '09A',
      'image': 'assets/images/jalandhar_raur.jpg',
    },
    {
      'roll': '103',
      'name': 'Noah Carter',
      'class': '12B',
      'image': 'assets/images/jalandhar_raur.jpg',
    },
    {
      'roll': '104',
      'name': 'Ava Thompson',
      'class': '11B',
      'image': 'assets/images/jalandhar_raur.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredStudents =
        students.where((student) {
          final matchesName = student['name']!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
          final matchesClass =
              selectedClass == 'Class' ||
              student['class']!.contains(selectedClass);
          final matchesSection =
              selectedSection == 'Section' ||
              student['class']!.endsWith(selectedSection);
          return matchesName && matchesClass && matchesSection;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Students", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox(),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Add student tapped")));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Normal Search TextField
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Class & Section Filter
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _buildFilterButton(
                  label: selectedClass,
                  onTap: showClassBottomSheet,
                ),
                SizedBox(width: 12),
                _buildFilterButton(
                  label: selectedSection,
                  onTap: showSectionBottomSheet,
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Student Cards
          Expanded(
            child:
                filteredStudents.isEmpty
                    ? Center(child: Text("No students found"))
                    : ListView.builder(
                      itemCount: filteredStudents.length,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        final student = filteredStudents[index];
                        return _buildStudentCard(student);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  // Student Card
  Widget _buildStudentCard(Map<String, String> student) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Roll No. ${student['roll']}",
                  style: TextStyle(color: Color(0xff637887)),
                ),
                SizedBox(height: 4),
                Text(
                  student['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Class ${student['class']}",
                  style: TextStyle(color: Color(0xff637887)),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("View details for ${student['name']}"),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xffF0F0F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "View Details",
                        style: TextStyle(
                          color: Color(0xff34A853),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xff34A853),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              student['image']!,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // Filter Button for Class & Section
  Widget _buildFilterButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(color: Colors.black)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom Sheet: Class
  void showClassBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children:
              ['Class', '09A', '10A', '11B', '12B']
                  .map(
                    (cls) => ListTile(
                      title: Text(cls),
                      onTap: () {
                        setState(() => selectedClass = cls);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
        );
      },
    );
  }

  // Bottom Sheet: Section
  void showSectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          children:
              ['Section', 'A', 'B']
                  .map(
                    (sec) => ListTile(
                      title: Text(sec),
                      onTap: () {
                        setState(() => selectedSection = sec);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
