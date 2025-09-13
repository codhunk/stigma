import 'package:flutter/material.dart';

class StudentAssignmentScreen extends StatelessWidget {
  const StudentAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assignments",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          return _buildAssignmentCard(assignment);
        },
      ),
    );
  }

  Widget _buildAssignmentCard(Map<String, String> assignment) {
    final bool isSubmitted = assignment['status'] == 'Submitted';
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSubmitted ? Colors.green.shade50 : Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assignment['subject'] ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSubmitted ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    assignment['status'] ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Assignment Title
            Text(assignment['title'] ?? '', style: TextStyle(fontSize: 15)),

            SizedBox(height: 8),

            // Due Date
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text(
                  "Due: ${assignment['dueDate']}",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Assignment List
final List<Map<String, String>> assignments = [
  {
    'subject': 'Mathematics',
    'title': 'Algebra Worksheet - Chapter 5',
    'dueDate': '12 Sept 2025',
    'status': 'Submitted',
  },
  {
    'subject': 'Physics',
    'title': 'Lab Report: Magnetic Fields',
    'dueDate': '14 Sept 2025',
    'status': 'Pending',
  },
  {
    'subject': 'English',
    'title': 'Essay: Future of Technology',
    'dueDate': '15 Sept 2025',
    'status': 'Submitted',
  },
  {
    'subject': 'Chemistry',
    'title': 'Assignment: Periodic Table Trends',
    'dueDate': '16 Sept 2025',
    'status': 'Pending',
  },
];
