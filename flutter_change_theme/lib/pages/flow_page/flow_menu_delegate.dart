import 'package:flutter/material.dart';

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> animation;
  FlowMenuDelegate({this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0;
    double y = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
