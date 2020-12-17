import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/animation/basic_animation_page/stairs_curve.dart';

class BasicAnimationPage extends StatefulWidget {
  @override
  _BasicAnimationPageState createState() => _BasicAnimationPageState();
}

class _BasicAnimationPageState extends State<BasicAnimationPage>
    with TickerProviderStateMixin {
  // double _size = 100;
  AnimationController _controller;

  // Color _color = Colors.blue;
  // Color _startColor = Colors.blue;
  // Color _endColor = Colors.purple;

  // Animation<Color> _animation;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    // );
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    //   lowerBound: 100,
    //   upperBound: 200,
    // );
    // _controller.addListener(() {
    //   setState(() {
    //     // _size = 100 + 100 * _controller.value;
    //     _size = _controller.value;
    //     if (_controller.status == AnimationStatus.completed) {
    //       _controller.reverse();
    //     } else if (_controller.status == AnimationStatus.dismissed) {
    //       _controller.forward();
    //     }
    //   });
    // });
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    // )..addListener(() {
    //     setState(() {
    //       _color = Color.lerp(_startColor, _endColor, _controller.value);
    //       if (_controller.status == AnimationStatus.completed) {
    //         _controller.reverse();
    //       } else if (_controller.status == AnimationStatus.dismissed) {
    //         _controller.forward();
    //       }
    //     });
    //   });
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    // )..addListener(() {
    //     setState(() {
    //       if (_controller.status == AnimationStatus.completed) {
    //         _controller.reverse();
    //       } else if (_controller.status == AnimationStatus.dismissed) {
    //         _controller.forward();
    //       }
    //     });
    //   });
    // _animation =
    //     ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
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
    _sizeAnimation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: StairsCurve(5)))
        .animate(_controller);
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
        title: Text('动画核心'),
      ),
      body: buildChildWidget(context),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          // height: _size,
          // width: _size,
          // color: _animation.value,
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text(
            '动画变大',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        onTap: () {
          _controller.forward();
        },
      ),
    );
  }
}
