
import 'package:flutter/material.dart';
import 'package:stigma/features/branch/screens/addscreen/calculatescreen.dart';
import 'package:stigma/features/branch/screens/addscreen/nearbycourier.dart';
import 'package:stigma/features/branch/screens/addscreen/shipparcel.dart';
import 'package:stigma/features/branch/screens/addscreen/trackscreen.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // Reusable Card Widget
  Widget _buildCard(String text, Function onTapAction) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.white.withOpacity(0.9),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => onTapAction(),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              SizedBox(width: 50),
              Text(
                text,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          "Services",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Inter',
          ),
        ),
        toolbarHeight: 70.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCard("Track Order", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackScreen()),
                  );
                }),
                _buildCard("Calculate Parcel", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParcelCalculator()),
                  );
                }),
                _buildCard("Ship Parcel", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShipParcelScreen()),
                  );
                }),
                _buildCard("Nearby Courier", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NearByCourierScreen(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
