import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvedAnimationPage extends StatefulWidget {
  @override
  _CurvedAnimationPageState createState() => _CurvedAnimationPageState();
}

class _CurvedAnimationPageState extends State<CurvedAnimationPage>
    with TickerProviderStateMixin {
  var iconList = [
    Constant.others + 'other_2.jpeg',
    Constant.others + 'other_3.jpeg',
    Constant.others + 'other_4.jpeg',
    Constant.others + 'other_5.jpeg',
  ];
  var _index = 0;
  var _index1 = 1;
  Widget child1;
  Widget child2;
  AnimationController _controller;
  Animation _animation;
  Animation _animation1;
  ClipRect _child1;
  ClipRect _child2;
  ClipRect _child3;
  ClipRect _child4;

  @override
  void initState() {
    init(_index, _index1);
    super.initState();
  }

  void init(int index1, int index2) {
    setup(_index, _index1);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)));
    _animation1 = Tween(begin: -pi / 2, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));
    _controller.forward();
  }

  void setup(int index1, int index2) {
    child1 = buildSubPage(iconList[index1 % iconList.length]);
    child2 = buildSubPage(iconList[index2 % iconList.length]);
    _child1 = ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: child1,
      ),
    );

    _child2 = ClipRect(
      child: Align(
        alignment: Alignment.centerRight,
        widthFactor: 0.5,
        child: child1,
      ),
    );

    _child3 = ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: child2,
      ),
    );

    _child4 = ClipRect(
      child: Align(
        alignment: Alignment.centerRight,
        widthFactor: 0.5,
        child: child2,
      ),
    );
  }

  void nextPage() {
    if (_controller.status == AnimationStatus.forward) {
      return;
    }
    if (_controller.status == AnimationStatus.completed) {
      _index += 1;
      _index1 += 1;

      Future.delayed(Duration(milliseconds: 200), () {
        init(_index, _index1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D翻书'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: buildChildWidget(context),
        ),
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: IconButton(
          icon: Icon(
            Icons.next_plan,
            color: Colors.white,
          ),
          onPressed: () {
            nextPage();
          },
        ),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: [
            _child1,
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_animation1.value),
              child: _child3,
            ),
          ],
        ),
        Container(
          width: ScreenAdapter.width(3),
          color: Theme.of(context).primaryColor,
        ),
        Stack(
          children: [
            _child4,
            Transform(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_animation.value),
              child: _child2,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSubPage(String iconPath) {
    return Container(
      padding: EdgeInsets.all(20),
      width: ScreenUtil().screenWidth - ScreenAdapter.width(3),
      height: ScreenUtil().screenHeight,
      // alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(iconPath),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 2,
              color: Colors.green,
            )),
      ),
    );
  }
}
