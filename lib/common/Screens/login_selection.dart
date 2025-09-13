import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:stigma/common/Screens/Students/login_screen.dart';
import 'package:stigma/common/Screens/Teacher/login_screen.dart';

class LoginSelectionPage extends StatefulWidget {
  @override
  _LoginSelectionPageState createState() => _LoginSelectionPageState();
}

class _LoginSelectionPageState extends State<LoginSelectionPage>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    // Start animation after a short delay
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade900, Colors.indigo.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Animated glass container
          Center(
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 70, color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      'Choose Login Type',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Student Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to Student Login
                        Get.to(() => StudentLoginPage());
                      },
                      icon: Icon(Icons.person, size: 24),
                      label: Text(
                        'Login as Student',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        foregroundColor: Colors.indigo,
                        minimumSize: Size(double.infinity, 50),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Teacher Button
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.to(() => TeacherLoginPage());
                      },
                      icon: Icon(Icons.person_outline, size: 24),
                      label: Text(
                        'Login as Teacher',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        foregroundColor: Colors.deepPurple,
                        minimumSize: Size(double.infinity, 50),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
