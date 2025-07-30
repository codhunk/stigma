import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800020),
        centerTitle: true,
        title: Text(
          "FAQs - ApnaParcel",
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
            Navigator.of(context).pop(); // Ensures the back button works
          },
        ),
        elevation: 0,
      ),
      body: FAQPage(),
    );
  }
}

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': '1. What is ApnaParcel?',
      'answer':
          'ApnaParcel is a reliable logistics and parcel delivery service ensuring timely and secure shipments across various locations.',
    },
    {
      'question': '2. How can I track my shipment?',
      'answer':
          'You can track your shipment using the tracking ID provided at the time of booking on our website or mobile app.',
    },
    {
      'question': '3. What are the delivery charges?',
      'answer':
          'Delivery charges vary based on distance, package weight, and delivery speed. You can check estimated costs on our website.',
    },
    {
      'question': '4. What items are restricted for shipping?',
      'answer':
          'We do not ship perishable goods, hazardous materials, and illegal items. Please refer to our guidelines for a full list.',
    },
    {
      'question': '5. How can I contact customer support?',
      'answer':
          'You can reach us through our customer support hotline or email us at support@apnaparcel.com.',
    },
    {
      'question': '6. Do you offer express delivery?',
      'answer':
          'Yes, we offer express delivery services for urgent shipments. You can select this option while booking your parcel.',
    },
    {
      'question': '7. Can I change the delivery address after booking?',
      'answer':
          'Yes, you can request an address change before dispatch. Contact customer support for assistance.',
    },
    {
      'question': '8. What payment methods do you accept?',
      'answer':
          'We accept credit/debit cards, UPI, net banking, and cash on delivery for eligible shipments.',
    },
    {
      'question': '9. Do you provide international shipping?',
      'answer':
          'Currently, we only offer domestic shipping, but we plan to expand our services soon.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ExpansionTile(
              title: Text(
                faqs[index]['question']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(faqs[index]['answer']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
