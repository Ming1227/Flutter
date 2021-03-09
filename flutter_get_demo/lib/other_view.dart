import 'package:flutter/material.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:flutter_get_demo/my_inherited_widget_view.dart';
import 'package:get/get.dart';

class OtherView extends StatelessWidget {
  final HomeController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'.tr),
      ),
      body: Container(
        width: context.mediaQuerySize.width,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('count'.tr + ': ${con.count}'),
          ElevatedButton(
            onPressed: () {
              Get.to(MyInheritedWidgetView(), transition: Transition.cupertino);
            },
            child: Text('InheritedWidget'),
          ),
          ElevatedButton(
            onPressed: () {
              con.updateLocale();
            },
            child: Text('changeLocale'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              con.updateTheme();
            },
            child: Text('changeTheme'.tr),
          ),
          ElevatedButton(
            onPressed: () {
              Get.snackbar('title', 'message');
            },
            child: Text('顶部snackbar'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.bottomSheet(
                  Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Title'),
                        Text('subTitle'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('取消');
                                Get.back();
                              },
                              child: Text('取消'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print('确认');
                                Get.back();
                              },
                              child: Text('确认'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.amber);
            },
            child: Text('底部弹窗'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.dialog(Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'subTitle',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            '取消',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                            child: Text(
                              '确定',
                            ),
                            onPressed: () {
                              Get.back();
                            })
                      ],
                    ),
                  ],
                ),
              ));
            },
            child: Text('弹窗'),
          )
        ],
      ),
    );
  }
}
