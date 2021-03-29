import 'package:flutter/material.dart';
import 'package:flutter_get_demo/basic/buttons/showbuttons.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:flutter_get_demo/my_applifecycle.dart';
import 'package:flutter_get_demo/other_view.dart';
import 'package:flutter_get_demo/person_info.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController con = Get.put(HomeController(), tag: 'HomeController');
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks'.tr + ': ${con.count}')),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Other'.tr),
          onPressed: () => Get.to(OtherView()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: con.increment,
      ),
    );
  }
}

class HomeView1 extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks'.tr + '1' + ': ${controller.count}')),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Other'.tr),
          onPressed: () => Get.to(OtherView()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}

class HomeView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomeView->build');
    // PersonUtil().myPrint();
    // PersonUtil().print('s1');
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Obx(() => Text('Clicks'.tr + '2' + ': ${controller.count}')),
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  child: Text('Go to Other'.tr),
                  onPressed: () =>
                      Get.to(OtherView(), transition: Transition.cupertino),
                ),
                OutlinedButton(
                  onPressed: () {
                    return Get.to(MyAppLifeCycle(),
                        transition: Transition.cupertino);
                  },
                  child: Text('App 生命周期'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        PersonUtil().updateData(age: 20, sex: '女');
                      },
                      child: Text('修改信息1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PersonUtil().updateData(username: 'harry123', sex: '男');
                      },
                      child: Text('修改信息2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PersonUtil().myPrint();
                      },
                      child: Text('打印信息'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(ShowButtons());
                        },
                        child: Text('自定义button')),
                    ElevatedButton(onPressed: () {}, child: Text('自定义icon')),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: controller.increment,
          ),
        );
      },
    );
  }
}
