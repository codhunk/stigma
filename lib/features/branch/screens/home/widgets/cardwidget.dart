import 'package:flutter/material.dart';
import 'package:stigma/features/branch/screens/home/widgets/uihelper.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const CustomCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        height: 140,
        width: 170,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomImage(imagePath),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                imagePath: 'Location.png',
                title: 'Find Your Location',
              ),
              const SizedBox(width: 20), // Space between the cards
              CustomCard(imagePath: 'Graph.png', title: 'Redirect Package'),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomCard(imagePath: 'Buy.png', title: 'Find Your Cart')],
        ),
      ],
    );
  }
}
