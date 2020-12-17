import 'package:flutter/material.dart';

class ASPageViewWidget extends StatefulWidget {
  final List<String> imgList;

  final double scaleFactor;

  final double height;

  ASPageViewWidget({
    Key key,
    this.imgList,
    this.scaleFactor = 0.8,
    this.height = 240,
  }) : super(key: key);

  @override
  _ASPageViewWidgetState createState() => _ASPageViewWidgetState();
}

class _ASPageViewWidgetState extends State<ASPageViewWidget> {
  PageController _pageController;

  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      // padding: EdgeInsets.symmetric(vertical: 5),
      child: PageView.builder(
        itemBuilder: (context, index) => buildChildPageItem(index),
        itemCount: 100,
        controller: _pageController,
      ),
    );
  }

  Widget buildChildPageItem(int index) {
    var matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale =
          1 - (_currentPageValue - index) * (1 - widget.scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currentPageValue.floor() + 1) {
      /* 右边的item */
      var currScale = widget.scaleFactor +
          (_currentPageValue - index + 1) * (1 - widget.scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      /* 左边的item */
      matrix4 = Matrix4.diagonal3Values(1.0, widget.scaleFactor, 1.0)
        ..setTranslationRaw(
            0.0, widget.height * (1 - widget.scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.imgList[index % widget.imgList.length]),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
