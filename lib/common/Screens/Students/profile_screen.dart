import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Components/app_bar.dart';
import 'package:stigma/common/Controller/bottom_nav_controller.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHelper.customAppBar(
        title: "Profile",
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.find<BottomNavController>().changePage(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 15, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      backgroundImage: AssetImage(
                        "assets/images/Profile_image.png",
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "John Smith",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Student Id: 2208410100041",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                    Text(
                      "Contact: abc@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
              Text(
                "Personal Info",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.grey[300]),
              Padding(
                padding: EdgeInsets.only(left: 8, top: 10, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Full Name:",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                    Text("John Smith", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Student Id:",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                    Text("2208410100041", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "Contact:",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.07),
                    Text("abc@gmail.com", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 10),
              Text(
                "ID CARD PREVIEW",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset("assets/images/Id_card.jpg"),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  "Student Id",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "John Smith",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              Text(
                "ID: 2208410100041",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              Divider(color: Colors.grey[300]),
              SizedBox(height: 15),
              Text(
                "Academic History",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0, right: 15),
                title: Text("Introduction to Programming"),
                subtitle: Text(
                  "Semester 1",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text("A", style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0, right: 15),
                title: Text("Calculus 1"),
                subtitle: Text(
                  "Semester 1",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text("B+", style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0, right: 15),
                title: Text("Data Structures"),
                subtitle: Text(
                  "Semester 2",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text("A-", style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0, right: 15),
                title: Text("Linear Algebra"),
                subtitle: Text(
                  "Semester 2",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text("B", style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
