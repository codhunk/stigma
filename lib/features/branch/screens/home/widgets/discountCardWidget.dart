import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        color: Color(0xffE3BCC5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          width: 350,
          height: 240,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Column
              _buildLeftColumn(),

              // Right Column
              _buildRightColumn(),
            ],
          ),
        ),
      ),
    );
  }

  // Left Column Widget
  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRichText('Get ', '15%', 28.0, FontWeight.w800, Color(0xff800020)),
        Text(
          "Cashback",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            fontFamily: 'Inter',
          ),
        ),
        _buildRichText(
          'Use Coupon code ',
          '#534725',
          14.0,
          FontWeight.w800,
          Color(0xff800020),
        ),
      ],
    );
  }

  // Right Column Widget
  Widget _buildRightColumn() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: Color(0xff800020), radius: 55.0),
        ],
      ),
    );
  }

  // RichText Widget Builder
  Widget _buildRichText(
    String firstText,
    String secondText,
    double fontSize,
    FontWeight fontWeight,
    Color secondTextColor,
  ) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Inter',
        ),
        children: [
          TextSpan(text: firstText, style: TextStyle(color: Colors.black)),
          TextSpan(text: secondText, style: TextStyle(color: secondTextColor)),
        ],
      ),
    );
  }
}
