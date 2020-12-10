import 'dart:math';

import 'package:flutter/material.dart';

class FlowCircleDelegate extends FlowDelegate {
  final double radius;
  FlowCircleDelegate(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1));
      y = radius * sin(i * pi / (context.childCount - 1));
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowCircleDelegate oldDelegate) {
    return true;
  }
}
