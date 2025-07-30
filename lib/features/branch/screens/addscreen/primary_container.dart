
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stigma/common/widgets/custom_shape/curved_edges/curved_edges_widgets.dart';
import 'package:stigma/utils/constants/colors.dart';

LatLng myCurrentLocation = const LatLng(28.480099, 77.538261);

class TPrimaryContainer extends StatelessWidget {
  const TPrimaryContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidgets(
      child: Container(
        color: AppColors.borderSecondary,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 340,
          width: double.infinity,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: myCurrentLocation,
                  zoom: 10,
                ),
              ),
              child, // Your passed child widget displayed on top of the map
            ],
          ),
        ),
      ),
    );
  }
}
