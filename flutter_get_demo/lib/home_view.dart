import 'package:flutter/material.dart';
import 'package:flutter_get_demo/homecontroller.dart';
import 'package:flutter_get_demo/other_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController con = Get.put(HomeController());
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
      },
    );
  }
}
