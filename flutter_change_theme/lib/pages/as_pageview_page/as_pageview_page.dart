import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/pages/as_pageview_page/as_pageview_widget.dart';

class ASPageViewPage extends StatefulWidget {
  @override
  _ASPageViewPageState createState() => _ASPageViewPageState();
}

class _ASPageViewPageState extends State<ASPageViewPage> {
  final _imgList = [
    Constant.adhots + 'adhots_2.jpg',
    Constant.adhots + 'adhots_3.jpg',
    Constant.adhots + 'adhots_5.jpg',
    Constant.adhots + 'adhots_6.jpg',
    Constant.adhots + 'adhots_7.jpg',
    Constant.adhots + 'adhots_8.jpg',
    Constant.adhots + 'adhots_9.jpg',
    Constant.adhots + 'adhots_10.jpg',
    Constant.adhots + 'adhots_11.jpg',
    Constant.adhots + 'adhots_12.jpg',
    Constant.adhots + 'adhots_13.jpg',
    Constant.adhots + 'adhots_14.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('广告页'),
      ),
      body: Center(
        child: ASPageViewWidget(
          imgList: _imgList,
        ),
      ),
    );
  }
}
