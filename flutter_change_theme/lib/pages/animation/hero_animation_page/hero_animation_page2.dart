import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';

class HeroAnimationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过渡动画2'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: 'hero',
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  Constant.adhots + 'adhots_5.jpg',
                  fit: BoxFit.fitWidth,
                ),
              )),
        ),
      ),
    );
  }
}
