import 'package:flutter/material.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:flutter_get_demo/my_inherited_widget.dart';
import 'package:get/instance_manager.dart';

class MyInheritedWidgetView extends StatefulWidget {
  @override
  _MyInheritedWidgetViewState createState() => _MyInheritedWidgetViewState();
}

class _MyInheritedWidgetViewState extends State<MyInheritedWidgetView> {
  @override
  Widget build(BuildContext context) {
    final HomeController con = Get.put(HomeController());
    return MyInheritedWidget(
      UserInfo(name: 'Harry', age: 18),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('InheritedWidget'),
            ),
            body: Center(
              child: A(
                child: F(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                MyInheritedWidget.of(context)
                    .updateData(UserInfo(name: 'Harry${con.count}', age: 16));
              },
              child: Icon(Icons.home),
            ),
          );
        },
      ),
    );
  }
}
