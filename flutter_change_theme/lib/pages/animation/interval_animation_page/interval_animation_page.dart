import 'package:flutter/material.dart';

class IntervalAnimationPage extends StatefulWidget {
  @override
  _IntervalAnimationPageState createState() => _IntervalAnimationPageState();
}

class _IntervalAnimationPageState extends State<IntervalAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // Animation _colorAnimation;
  // Animation _sizeAnimation;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
      });

    // _colorAnimation =
    //     ColorTween(begin: Colors.green, end: Colors.purple).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Interval(0.5, 1.0),
    //   ),
    // );

    // _sizeAnimation = Tween(
    //   begin: 100.0,
    //   end: 300.0,
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Interval(0.0, 0.5),
    // ));

    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 100.0, end: 200.0)
              .chain(CurveTween(curve: Curves.decelerate)),
          weight: 30),
      TweenSequenceItem(tween: ConstantTween(200.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 30),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组合动画'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          // height: _sizeAnimation.value,
          // width: _sizeAnimation.value,
          // color: _colorAnimation.value,
          height: _animation.value,
          width: _animation.value,
          color: Colors.amber,
          child: Text(
            '大小颜色组合动画',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
