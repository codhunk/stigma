import 'package:flutter/material.dart';
import 'dart:async';
import 'login_selection.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Update progress every 50ms
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        progress += 0.02; // increment by 2%
        if (progress >= 1.0) {
          progress = 1.0;
          _timer?.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LoginSelectionPage()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Welcome to STIGMA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Linear Progress Bar
            Container(
              width: 250,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${(progress * 100).toInt()}%",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
