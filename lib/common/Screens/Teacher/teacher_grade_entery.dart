import 'package:flutter/material.dart';

class TeacherGradeEntryScreen extends StatefulWidget {
  const TeacherGradeEntryScreen({super.key});

  @override
  State<TeacherGradeEntryScreen> createState() =>
      _TeacherGradeEntryScreenState();
}

class _TeacherGradeEntryScreenState extends State<TeacherGradeEntryScreen> {
  String selectedSubject = 'Mathematics';
  final List<String> subjects = [
    'Mathematics',
    'Science',
    'English',
    'History',
    'Computer',
  ];

  // Sample student list
  final List<Map<String, dynamic>> students = [
    {'name': 'Aarav Sharma', 'grade': ''},
    {'name': 'Diya Verma', 'grade': ''},
    {'name': 'Kabir Singh', 'grade': ''},
    {'name': 'Meera Das', 'grade': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Grades",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Subject Dropdown
            Row(
              children: [
                const Text(
                  "Subject:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedSubject,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items:
                        subjects.map((subject) {
                          return DropdownMenuItem(
                            value: subject,
                            child: Text(subject),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Student Grade Entries
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          student['name'][0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(student['name']),
                      trailing: SizedBox(
                        width: 80,
                        child: TextFormField(
                          initialValue: student['grade'],
                          onChanged: (value) {
                            setState(() {
                              student['grade'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Mark",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Submit logic here
                  for (var student in students) {
                    print(
                      "Grade for ${student['name']} in $selectedSubject: ${student['grade']}",
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Grades submitted successfully!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Submit Grades",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
