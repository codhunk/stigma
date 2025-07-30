// import 'package:apnaparcelfinal/features/branch/screens/menu/faq/faqscreen.dart';
// import 'package:apnaparcelfinal/features/branch/screens/menu/helpandsupport/helpsupportscreen.dart';
// import 'package:apnaparcelfinal/features/branch/screens/menu/payment/paymentscreen.dart';
// import 'package:apnaparcelfinal/features/branch/screens/menu/settings/settingscreen.dart';
// import 'package:flutter/material.dart';

// class TListItemsWidget extends StatelessWidget {
//   const TListItemsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> settingsOptions = [
//       {
//         'icon': Icons.notifications,
//         'title': 'Notification',
//         'onTap': () {
//           // Handle notification tap
//         },
//       },
//       {
//         'icon': Icons.settings,
//         'title': 'Settings',
//         'onTap': () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SettingsScreen()),
//           );
//         },
//       },
//       {
//         'icon': Icons.help_outline,
//         'title': 'Help and Support',
//         'onTap': () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => HelpSupportPage()),
//           );
//         },
//       },
//       {
//         'icon': Icons.payment,
//         'title': 'Payment Setting',
//         'onTap': () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => PaymentSettingsPage()),
//           );
//         },
//       },
//       {
//         'icon': Icons.security,
//         'title': 'Security',
//         'onTap': () {
//           // Handle security tap
//         },
//       },
//       {
//         'icon': Icons.question_answer,
//         'title': 'FAQ',
//         'onTap': () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => FAQScreen()),
//           );
//         },
//       },
//       {'icon': Icons.logout, 'title': 'Logout', 'onTap': () {}},
//     ];

//     return Container(
//       padding: EdgeInsets.all(0), // Optional padding for the container
//       child: Column(
//         children:
//             settingsOptions.map((option) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: option['onTap'],
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: ListTile(
//                         leading: Icon(
//                           option['icon'],
//                           color: Color(0xff800020),
//                           size: 28,
//                         ),
//                         title: Text(
//                           option['title'],
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Lato',
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Divider(color: Colors.grey[300], thickness: 1),
//                 ],
//               );
//             }).toList(),
//       ),
//     );
//   }
// }
