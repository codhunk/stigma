import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';
import 'package:stigma/utils/constants/image_strings.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildCard(String title, String content, IconData icon) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 28, color: AppColors.borderSecondary),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        content,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: AppColors.borderSecondary,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header with logo and company name
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  Image.asset(AppImages.darkAppLogo, height: 80),
                  const SizedBox(height: 12),
                  const Text(
                    "ApnaParcel Logistics",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Established in 2023",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Cards
            buildCard(
              "Who We Are",
              "ApnaParcel is a modern logistics company dedicated to transforming how parcels move across India. Since 2023, we offer fast, secure, and reliable delivery services that connect people and businesses efficiently.",
              Icons.business,
            ),
            buildCard(
              "Our Mission",
              "To simplify logistics through technology and provide end-to-end parcel delivery solutions that are accessible, affordable, and efficient for everyone.",
              Icons.flag,
            ),
            buildCard(
              "Our Vision",
              "To be India’s most trusted logistics partner, setting new benchmarks in speed, service quality, and customer satisfaction.",
              Icons.remove_red_eye,
            ),
            buildCard(
              "Contact Us",
              "📧 support@apnaparcel.com\n📞 +91 9876543210\n📍 ApnaParcel HQ, New Delhi, India",
              Icons.contact_mail,
            ),
          ],
        ),
      ),
    );
  }
}
