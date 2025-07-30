import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:stigma/utils/constants/sizes.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800020),
        centerTitle: true,
        title: Text(
          "Help & Support",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Inter',
          ),
        ),
        toolbarHeight: 60.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "How can we assist you?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      LucideIcons.headphones,
                      color: Color(0xff800020),
                    ),
                    title: Text("Customer Support"),
                    subtitle: Text(
                      "Get assistance with your orders and deliveries.",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(LucideIcons.truck, color: Color(0xff800020)),
                    title: Text("Track Order"),
                    subtitle: Text("Check your shipment status in real-time."),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      LucideIcons.fileText,
                      color: Color(0xff800020),
                    ),
                    title: Text("Terms & Policies"),
                    subtitle: Text("Read about our policies and regulations."),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(LucideIcons.mail, color: Color(0xff800020)),
                label: Text(
                  "Contact Us",
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
