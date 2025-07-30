import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stigma/utils/constants/colors.dart';

class TShipmentHistoryWidgets extends StatefulWidget {
  const TShipmentHistoryWidgets({super.key});

  @override
  _TShipmentHistoryWidgetsState createState() =>
      _TShipmentHistoryWidgetsState();
}

class _TShipmentHistoryWidgetsState extends State<TShipmentHistoryWidgets> {
  int _currentIndex = 0;

  final List<Widget> items = List.generate(
    4,
    (index) => TShipmentHistoryCard(index: index),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: items,
            options: CarouselOptions(
              height: 280,
              aspectRatio: 16 / 9,
              viewportFraction: 0.96,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: _currentIndex == index ? 12 : 10,
                height: _currentIndex == index ? 12 : 10,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index
                          ? AppColors.borderSecondary
                          : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TShipmentHistoryCard extends StatelessWidget {
  final int index;

  TShipmentHistoryCard({super.key, required this.index});

  final TextStyle _labelTextStyle = TextStyle(
    color: Colors.white.withOpacity(0.7),
    fontSize: 14,
  );

  final TextStyle _valueTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );

  // final ButtonStyle _statusButtonStyle = ElevatedButton.styleFrom(
  //   backgroundColor: Color(0xff800020),
  //   foregroundColor: Colors.black,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  // );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: const Color(0xff800020),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        width: double.infinity,
        height: 285,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildColumn(
                label1: "Tracking Number:",
                value1: "#98277636575$index",
                label2: "Customer:",
                value2: "John Doe",
                label3: "Status",
                statusButtonText: "In Transit",
              ),
            ),
            _buildMiddleColumn(),
            Expanded(
              child: _buildColumn(
                label1: "From:",
                value1: "Delhi",
                label2: "To:",
                value2: "Bangalore",
                label3: "Arrival Date:",
                value3: "12-02-2025",
                isRightAligned: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildColumn({
    required String label1,
    required String value1,
    required String label2,
    required String value2,
    required String label3,
    String? value3,
    String? statusButtonText,
    bool isRightAligned = false,
  }) {
    return Column(
      crossAxisAlignment:
          isRightAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        _buildText(label1, _labelTextStyle),
        _buildText(value1, _valueTextStyle),
        const SizedBox(height: 20),
        _buildText(label2, _labelTextStyle),
        _buildText(value2, _valueTextStyle),

        if (value3 != null) ...[
          const SizedBox(height: 20),
          _buildText(label3, _labelTextStyle),
          _buildText(value3, _valueTextStyle),
        ],
        if (statusButtonText != null) ...[
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 95,
              height: 35,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Colors
                          .grey[300], // Replace with your desired button color
                  borderRadius: BorderRadius.circular(
                    18,
                  ), // Adjust for rounded corners
                ),
                alignment: Alignment.center,
                child: const Text(
                  "In Transit",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Text _buildText(String text, TextStyle style) => Text(text, style: style);

  Column _buildMiddleColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(radius: 5.5, backgroundColor: Color(0xffd9d9d9)),
        const SizedBox(height: 5),
        ...List.generate(
          25,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8),
            child: SizedBox(
              width: 1,
              height: 4,
              child: ColoredBox(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const CircleAvatar(radius: 5.5, backgroundColor: Color(0xffd9d9d9)),
      ],
    );
  }
}
