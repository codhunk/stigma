import 'package:flutter/material.dart';

class AppBarHelper {
  static AppBar customAppBar({
    required String title,
    Widget? leading,
    List<Widget>? actions,
    bool centerTitle = false,
  }) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
    );
  }
}
