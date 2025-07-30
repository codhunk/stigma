import 'package:flutter/material.dart';
import 'package:stigma/common/widgets/custom_shape/curved_edges/curved_edges.dart';

class TCurvedEdgesWidgets extends StatelessWidget {
  const TCurvedEdgesWidgets({Key? key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
