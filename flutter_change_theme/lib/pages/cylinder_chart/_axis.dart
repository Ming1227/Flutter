import 'package:flutter/material.dart';

class AxisXY extends StatelessWidget {
  final Widget child;

  const AxisXY({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: child,
    );
  }
}
