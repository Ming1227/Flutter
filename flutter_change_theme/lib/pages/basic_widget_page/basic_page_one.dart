import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';

class BasicPageOne extends StatefulWidget {
  @override
  _BasicPageOneState createState() => _BasicPageOneState();
}

class _BasicPageOneState extends State<BasicPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件1'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // shape: AutomaticNotchedShape(
        //   RoundedRectangleBorder(),
        //   StadiumBorder(side: BorderSide()),
        // ),
        elevation: 8,
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.people), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Theme.of(context).accentColor,
      //   icon: Icon(Icons.add),
      //   label: const Text('center'),
      //   onPressed: () {},
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildChildWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 400,
          child: Image.asset(
            Constant.others + 'other_3.jpeg',
            fit: BoxFit.fill,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Center(
            child: Container(
              // width: 300,
              // height: 400,
              // alignment: Alignment.bottomRight,
              color: Theme.of(context).accentColor.withOpacity(0.5),
              child: Text(
                '模糊图片',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
