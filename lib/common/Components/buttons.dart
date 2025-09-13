import 'package:flutter/material.dart';

class Buttons {
  static Widget button({
    required String text,
    Color color = const Color.fromARGB(255, 64, 51, 205),
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
