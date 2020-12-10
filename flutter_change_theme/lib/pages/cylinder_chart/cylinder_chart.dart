import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/cylinder_chart/_cylinder.dart';
import '_axis.dart';

class CylinderChartPage extends StatefulWidget {
  @override
  _CylinderChartPageState createState() => _CylinderChartPageState();
}

class _CylinderChartPageState extends State<CylinderChartPage> {
  final double _width = 30;
  List<double> _heightList = [60, 50, 80, 120, 150];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('柱状图'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChild(),
      ),
    );
  }

  Widget buildChild() {
    return Center(
      child: Container(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 300,
        width: 300,
        child: Stack(
          children: [
            AxisXY(),
            Positioned.fill(
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  _heightList.length,
                  (index) => Cylinder(
                    height: _heightList[index],
                    width: _width,
                    color: Colors.primaries[index],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 30,
              child: OutlineButton(
                child: Text('反转'),
                onPressed: () {
                  setState(() {
                    _heightList = _heightList.reversed.toList();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
