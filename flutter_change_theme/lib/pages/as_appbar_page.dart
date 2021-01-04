import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ASAppBarPage extends StatefulWidget {
  @override
  _ASAppBarPageState createState() => _ASAppBarPageState();
}

class _ASAppBarPageState extends State<ASAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildASAppBar(),
      appBar: AppBar(
        title: Text('PreferredSize'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 50,
            color: Colors.amber,
          ),
        ),
      ),
      body: Center(
        child: Text(
          '自定义AppBar',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget buildASAppBar() {
    return PreferredSize(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: Text(
            '自定义AppBar',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(ScreenUtil().appBarHeight + 44),
    );
  }
}
