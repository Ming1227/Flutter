import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StairsCurve extends Curve {
  final int num;
  double _perStairY;
  double _perStairX;

  StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }

  @override
  double transformInternal(double t) {
    return _perStairY * (t / _perStairX).floor();
  }
}
