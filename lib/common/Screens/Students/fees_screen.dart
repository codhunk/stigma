import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Components/app_bar.dart';
import 'package:stigma/common/Components/buttons.dart';
import 'package:stigma/common/Components/container.dart';
import 'package:stigma/common/Controller/bottom_nav_controller.dart';

class MonthlyFee {
  final String month;
  final String feeType;
  final double amount;
  final bool isPaid;

  MonthlyFee({
    required this.month,
    required this.feeType,
    required this.amount,
    required this.isPaid,
  });
}

class StudentFeesScreen extends StatelessWidget {
  StudentFeesScreen({super.key});
  final RxInt selectedButton = 0.obs;

  // Sample fees history data
  final List<MonthlyFee> feesHistory = [
    MonthlyFee(
      month: "Oct 2023",
      feeType: "Tuition Fee",
      amount: 31105,
      isPaid: true,
    ),
    MonthlyFee(
      month: "Sep 2023",
      feeType: "Library Fee",
      amount: 1500,
      isPaid: true,
    ),
    MonthlyFee(
      month: "Aug 2023",
      feeType: "Sports Fee",
      amount: 1200,
      isPaid: false,
    ),
    MonthlyFee(
      month: "Jul 2023",
      feeType: "Tuition Fee",
      amount: 31105,
      isPaid: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Ensure BottomNavController is registered
    if (!Get.isRegistered<BottomNavController>()) {
      Get.put(BottomNavController());
    }
    final bottomNavController = Get.find<BottomNavController>();

    // Calculate total pending fees
    final totalPending = feesHistory
        .where((fee) => !fee.isPaid)
        .fold(0.0, (sum, fee) => sum + fee.amount);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 248, 253),
      appBar: AppBarHelper.customAppBar(
        title: "Fees",
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            bottomNavController.changePage(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Semester Fees Container
              ContainerBuilder.buildFlexContainer(
                width: MediaQuery.of(context).size.width,
                height: 300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 234, 233, 233),
                  width: 2,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Semester Fees",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "₹ 124,420",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Your total pending fees from April to October",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () => selectedButton.value = 0,
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                  gradient:
                                      selectedButton.value == 0
                                          ? LinearGradient(
                                            colors: [
                                              Color(0xFF6241CD),
                                              Color(0xFF947DFF),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                          : LinearGradient(
                                            colors: [
                                              Colors.grey.shade400,
                                              Colors.grey.shade500,
                                            ],
                                          ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 4),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay Custom",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Obx(
                            () => GestureDetector(
                              onTap: () => selectedButton.value = 1,
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                  gradient:
                                      selectedButton.value == 1
                                          ? LinearGradient(
                                            colors: [
                                              Color(0xFF6241CD),
                                              Color.fromARGB(
                                                255,
                                                130,
                                                103,
                                                249,
                                              ),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                          : LinearGradient(
                                            colors: [
                                              Colors.grey.shade400,
                                              Colors.grey.shade500,
                                            ],
                                          ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 4),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay All",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount Due",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("₹ 31,105"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Pending Fees Total
              if (totalPending > 0)
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 5),
                  child: Text(
                    "Pending Fees: ₹ ${totalPending.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),

              // Fees History Title
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                child: Text(
                  "Fees History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              // Monthly-wise Fees List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: feesHistory.length,
                itemBuilder: (context, index) {
                  final fee = feesHistory[index];
                  return Card(
                    elevation: 0.3,
                    color: fee.isPaid ? Colors.white : Colors.red[50],
                    child: ListTile(
                      title: Text(
                        fee.month,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(fee.feeType),
                      trailing: Text(
                        "₹ ${fee.amount.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 15,
                          color: fee.isPaid ? Colors.black : Colors.red,
                          fontWeight:
                              fee.isPaid ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 10),
              Center(
                child: Buttons.button(
                  text: "Pay Now",
                  height: 45,
                  width: MediaQuery.of(context).size.width - 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
