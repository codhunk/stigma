

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/branch/screens/menu/faq/faqscreen.dart';
import 'package:stigma/features/branch/screens/menu/helpandsupport/helpsupportscreen.dart';
import 'package:stigma/features/branch/screens/menu/payment/paymentscreen.dart';
import 'package:stigma/features/branch/screens/menu/settings/settingscreen.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/helpers/helper_functions.dart';

class TListItemsWidget extends StatelessWidget {
  TListItemsWidget({super.key});
  final user = FirebaseAuth.instance.currentUser;
  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = HelperFunctions.isDarkMode(context);
    final Color textColor = isDarkMode ? AppColors.white : AppColors.black;

    final List<Map<String, dynamic>> settingsOptions = [
      {'icon': Icons.notifications, 'title': 'Notification', 'onTap': () {}},
      {
        'icon': Icons.settings,
        'title': 'Settings',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
      },
      {
        'icon': Icons.help_outline,
        'title': 'Help and Support',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSupportPage()),
          );
        },
      },
      {
        'icon': Icons.payment,
        'title': 'Payment Setting',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentSettingsPage()),
          );
        },
      },
      {'icon': Icons.security, 'title': 'Security', 'onTap': () {}},
      {
        'icon': Icons.question_answer,
        'title': 'FAQ',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQScreen()),
          );
        },
      },
      {
        'icon': Icons.logout,
        'title': 'Logout',
        'onTap': () => AuthenticationRepository.instance.logout(),
      },
    ];

    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children:
            settingsOptions.map((option) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: option['onTap'],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(
                          option['icon'],
                          color: Color(0xff800020),
                          size: 28,
                        ),
                        title: Text(
                          option['title'],
                          style: TextStyle(
                            color: textColor,
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[300], thickness: 1),
                ],
              );
            }).toList(),
      ),
    );
  }
}
