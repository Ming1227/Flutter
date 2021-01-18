import 'package:flutter/material.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:get/get.dart';

class OtherView extends StatelessWidget {
  final HomeController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'.tr),
      ),
      body: buildChildWidget(),
    );
  }

  Widget buildChildWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('count'.tr + ': ${con.count}'),
          RaisedButton(
            onPressed: () {
              con.updateLocale();
            },
            child: Text('changeLocale'.tr),
          ),
          RaisedButton(
            onPressed: () {
              con.updateTheme();
            },
            child: Text('changeTheme'.tr),
          ),
          RaisedButton(
            onPressed: () {
              Get.snackbar('title', 'message');
            },
            child: Text('顶部snackbar'),
          ),
          RaisedButton(
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
                            RaisedButton(
                              onPressed: () {
                                print('取消');
                                Get.back();
                              },
                              child: Text('取消'),
                            ),
                            RaisedButton(
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
          RaisedButton(
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
                        FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            '取消',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
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
