import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TeacherProfileScreen extends StatefulWidget {
  @override
  _TeacherProfileScreenState createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  final Color primaryColor = Color(0xFF3E3E3E);
  final Color accentColor = Color(0xFFF6F6F6);
  final Color backgroundColor = Color(0xFFF1F5FF); // Theme background

  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      _imageFile != null
                          ? FileImage(_imageFile!)
                          : AssetImage('assets/images/Profile_image.png')
                              as ImageProvider,
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: InkWell(
                    onTap: _pickImage,
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Icon(Icons.edit, size: 20, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Davis Thompson",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Math Teacher", style: TextStyle(color: Colors.grey)),
            Text("Room 201", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),
            _sectionTitle("Personal Info"),
            SizedBox(height: 12),
            _infoTile(Icons.phone, "Phone", "+91 1234567890"),
            _infoTile(
              Icons.email_outlined,
              "Email",
              "thompson.math@sunrise.edu",
            ),
            _infoTile(Icons.apartment_outlined, "Department", "Mathematics"),

            SizedBox(height: 15),
            _sectionTitle("Actions"),
            SizedBox(height: 10),
            _actionTile(Icons.edit_outlined, "Edit Profile", () {}),
            _actionTile(Icons.lock_outline, "Change Password", () {}),
            _actionTile(Icons.logout, "Logout", () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Logged out")));
            }),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // Contrast against theme background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          _iconSquare(icon),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionTile(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white, // Contrast against theme background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            _iconSquare(icon),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconSquare(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 207, 207, 239),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 24, color: Colors.black87),
    );
  }
}
