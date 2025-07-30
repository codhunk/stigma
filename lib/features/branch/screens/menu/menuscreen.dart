// import 'package:apnaparcelfinal/common/widgets/appbar/appbar.dart';
// import 'package:apnaparcelfinal/common/widgets/custom_shape/containers/primary_header_container.dart';
// import 'package:apnaparcelfinal/features/branch/screens/home/widgets/TListItemsWidget.dart';
// import 'package:apnaparcelfinal/features/branch/screens/menu/widgets/widgets/TListItemsWidget.dart';
// import 'package:apnaparcelfinal/utils/constants/colors.dart';
// import 'package:apnaparcelfinal/utils/constants/image_strings.dart';
// import 'package:apnaparcelfinal/utils/constants/sizes.dart';
// import 'package:apnaparcelfinal/utils/constants/textstring.dart';
// import 'package:apnaparcelfinal/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';

// class HomeScreen1 extends StatelessWidget {
//   const HomeScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = HelperFunctions.isDarkMode(context);

//     return Scaffold(
//       // appBar: TAppBar(title: const Text('Home Screen')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TPrimaryHeaderContainerWidgets(
//               child: Column(
//                 children: [
//                   SizedBox(height: 25),
//                   TAppBar(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 28,
//                               backgroundImage:
//                                   dark
//                                       ? AssetImage(AppImages.darkprofile)
//                                       : AssetImage(AppImages.lightprofile),
//                             ),

//                             SizedBox(
//                               width: 15,
//                             ), // Space between the image and text
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   TText.emailTitle,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelMedium!
//                                       .apply(color: AppColors.grey),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   TText.fullNameTitle,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineSmall!
//                                       .apply(color: AppColors.grey),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       Stack(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.circle, size: 50),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),

//                   // const SizedBox(height: TSizes.spaceBtwSections),
//                   // TSearchWidget(),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: TSizes.defaultSpace,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 115,
//                           width: 170,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               bottomLeft: Radius.circular(10),
//                             ),
//                             color: Color(0xffBE637A),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '03',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                               Text(
//                                 'Sent',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 90,
//                           width: 1,
//                           color: Color(0xff800020).withOpacity(0.5),
//                         ),

//                         Container(
//                           height: 115,
//                           width: 170,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10),
//                               bottomRight: Radius.circular(10),
//                             ),
//                             color: Color(0xffBE637A),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '09',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                               Text(
//                                 'Recieved',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             TListItemsWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
