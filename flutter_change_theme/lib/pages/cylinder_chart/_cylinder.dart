import 'package:flutter/material.dart';

class Cylinder extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Cylinder({Key key, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: height,
      width: width,
      color: color,
    );
  }
}
