import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stigma/common/Screens/Students/paymentcontroller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F2FF),
      appBar: AppBar(
        title: Text("Pay Fees", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF6241CD),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Grid
            Expanded(
              child: GridView.builder(
                itemCount: controller.paymentMethods.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  return Obx(() {
                    final method = controller.paymentMethods[index];
                    final isSelected =
                        controller.selectedPayment.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectPayment(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFF6241CD) : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color:
                                isSelected
                                    ? Color(0xFF6241CD)
                                    : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              method["icon"],
                              size: 40,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                            SizedBox(height: 10),
                            Text(
                              method["title"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color:
                                    isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            // Amount & Pay button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount to Pay",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹ 31,105",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF6241CD),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          "Payment",
                          "Proceeding with ${controller.selectedPaymentTitle}",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          colorText: Color(0xFF6241CD),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6241CD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Pay Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
