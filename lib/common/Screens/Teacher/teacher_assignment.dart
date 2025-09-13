import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TeacherAssignAssignmentScreen extends StatefulWidget {
  const TeacherAssignAssignmentScreen({super.key});

  @override
  State<TeacherAssignAssignmentScreen> createState() =>
      _TeacherAssignAssignmentScreenState();
}

class _TeacherAssignAssignmentScreenState
    extends State<TeacherAssignAssignmentScreen> {
  String selectedSubject = 'Mathematics';
  final List<String> subjects = [
    'Mathematics',
    'Science',
    'English',
    'History',
    'Computer',
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dueDate;

  bool selectAll = false; // For "Select All" checkbox

  // Sample student list
  final List<Map<String, dynamic>> students = List.generate(
    20,
    (index) => {'name': 'Student ${index + 1}', 'selected': false},
  );

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var student in students) {
        student['selected'] = selectAll;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assign Assignment",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Dropdown
            const Text(
              "Subject:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedSubject,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items:
                  subjects
                      .map(
                        (subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(subject),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value!;
                });
              },
            ),
            const SizedBox(height: 10),

            // Assignment Title
            const Text(
              "Title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter assignment title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Assignment Description
            const Text(
              "Description:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Enter assignment description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Due Date
            const Text(
              "Due Date:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _dueDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dueDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dueDate == null
                          ? "Select due date"
                          : DateFormat('dd MMM yyyy').format(_dueDate!),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.deepPurple),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Select Students:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // const SizedBox(height: 8),

            // Select All Checkbox
            CheckboxListTile(
              title: const Text("Select All"),
              value: selectAll,
              activeColor: Colors.deepPurple,
              onChanged: toggleSelectAll,
            ),

            // Student List Scrollable
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return CheckboxListTile(
                      title: Text(student['name']),
                      value: student['selected'],
                      activeColor: Colors.deepPurple,
                      onChanged: (bool? value) {
                        setState(() {
                          student['selected'] = value!;
                          // Update selectAll if necessary
                          selectAll = students.every((s) => s['selected']);
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Fixed bottom button
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                final assignedStudents =
                    students
                        .where((s) => s['selected'] == true)
                        .map((s) => s['name'])
                        .toList();
                if (_titleController.text.isEmpty ||
                    _descriptionController.text.isEmpty ||
                    _dueDate == null ||
                    assignedStudents.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please fill all fields and select at least one student.",
                      ),
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Assignment assigned successfully!"),
                  ),
                );

                // Clear form
                _titleController.clear();
                _descriptionController.clear();
                _dueDate = null;
                for (var student in students) {
                  student['selected'] = false;
                }
                selectAll = false;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Assign", style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
