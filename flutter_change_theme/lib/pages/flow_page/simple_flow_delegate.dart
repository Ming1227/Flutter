import 'package:flutter/material.dart';

class SimpleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      context.paintChild(i,
          transform: Matrix4.translationValues(0, i * 50.0, 0));
    }
  }

  @override
  bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
    return false;
  }
}
