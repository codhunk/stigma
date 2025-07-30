import 'package:flutter/material.dart';
import 'package:stigma/data/repositories.authentication/authentication_repository.dart';
import 'package:stigma/features/branch/screens/menu/payment/paymentscreen.dart';
import 'package:stigma/features/branch/screens/menu/settings/about_us.dart';
import 'package:stigma/features/branch/screens/menu/settings/accountsetting.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800020),
        centerTitle: true,
        title: Text(
          "Settings",
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
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Color(0xff800020)),
            title: Text("Account Settings"),
            subtitle: Text("Manage your account details"),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff800020)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSettingsPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Color(0xff800020)),
            title: Text("Privacy & Security"),
            subtitle: Text("Change password, enable 2FA"),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff800020)),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Color(0xff800020),
              size: 28,
            ),
            title: Text("Notifications"),
            subtitle: Text("Manage notification preferences"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff800020),
              size: 28,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.credit_card,
              color: Color(0xff800020),
              size: 28,
            ),
            title: Text("Payment Settings"),
            subtitle: Text("Manage your payment methods"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff800020),
              size: 28,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentSettingsPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff800020), size: 28),
            title: Text("About Us"),
            subtitle: Text("Learn more about our company"),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff800020)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Color(0xff800020), size: 28),
            title: Text("Logout"),
            subtitle: Text("Sign out of your account"),
            trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff800020)),
            onTap: () => AuthenticationRepository.instance.logout(),
          ),
        ],
      ),
    );
  }
}
