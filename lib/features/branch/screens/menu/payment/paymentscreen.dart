import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PaymentSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800020),
        centerTitle: true,
        title: Text(
          "Payment Setting",
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
              "Manage Your Payment Methods",
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
                      LucideIcons.creditCard,
                      color: Color(0xff800020),
                    ),
                    title: Text("Credit/Debit Card"),
                    subtitle: Text("Visa, MasterCard, Amex"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(LucideIcons.wallet, color: Color(0xff800020)),
                    title: Text("Digital Wallets"),
                    subtitle: Text("PayPal, Google Pay, Apple Pay"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      LucideIcons.banknote,
                      color: Color(0xff800020),
                    ),
                    title: Text("Bank Transfer"),
                    subtitle: Text("Linked bank accounts"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff800020),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(LucideIcons.plusCircle, color: Color(0xff800020)),
                label: Text(
                  "Add Payment Method",
                  style: TextStyle(color: Color(0xffffffff)),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
