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
    var x = 0.0;
    var y = 0.0;
    for (var i = 0; i < context.childCount; i++) {
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
