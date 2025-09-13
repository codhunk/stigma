import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxInt selectedPayment = 0.obs;

  final List<Map<String, dynamic>> paymentMethods = [
    {"title": "Card", "icon": Icons.credit_card},
    {"title": "UPI", "icon": Icons.account_balance_wallet},
    {"title": "Net Banking", "icon": Icons.account_balance},
    {"title": "Wallet", "icon": Icons.wallet},
    {"title": "Scanner", "icon": Icons.qr_code_scanner},
  ];

  void selectPayment(int index) {
    selectedPayment.value = index;
  }

  String get selectedPaymentTitle =>
      paymentMethods[selectedPayment.value]["title"];
}
