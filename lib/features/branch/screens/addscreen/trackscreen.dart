import 'package:flutter/material.dart';
import 'package:stigma/common/widgets/appbar/appbar.dart';
import 'package:stigma/features/branch/screens/addscreen/TSearchTrackWidget.dart';
import 'package:stigma/features/branch/screens/addscreen/primary_container.dart';
import 'package:stigma/features/branch/screens/home/widgets/shipmenthistory.dart';
import 'package:stigma/utils/constants/colors.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.buttonPrimary),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: TPrimaryContainer(
                child: Column(
                  children: [
                    TAppBar(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    TSearchTrackWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TShipmentHistoryWidgets(),
          ],
        ),
      ),
    );
  }
}
