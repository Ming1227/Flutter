import 'package:flutter/material.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:flutter_get_demo/my_applifecycle.dart';
import 'package:flutter_get_demo/other_view.dart';
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
        child: RaisedButton(
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
        child: RaisedButton(
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
                RaisedButton(
                  child: Text('Go to Other'.tr),
                  onPressed: () =>
                      Get.to(OtherView(), transition: Transition.cupertino),
                ),
                RaisedButton(
                  onPressed: () {
                    return Get.to(MyAppLifeCycle(),
                        transition: Transition.cupertino);
                  },
                  child: Text('App 生命周期'),
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
