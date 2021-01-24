import 'package:get/get.dart';

import 'package:flutter/material.dart';

class MyAppLifeCycle extends StatefulWidget {
  @override
  _MyAppLifecycleState createState() => _MyAppLifecycleState();
}

class _MyAppLifecycleState extends State<MyAppLifeCycle>
    with WidgetsBindingObserver {
  var _stateStr = ''.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _stateStr.value = 'resumed 前台运行';
      print('state: resumed 前台运行');
    }

    if (state == AppLifecycleState.paused) {
      _stateStr.value = 'paused 后台运行';
      print('state: paused 后台运行');
    }

    if (state == AppLifecycleState.inactive) {
      _stateStr.value = 'inactive 非激活的，被中断的';
      print('state: inactive 非激活的，被中断的');
    }

    if (state == AppLifecycleState.detached) {
      _stateStr.value = 'detached 与平台分离';
      print('state: detached 应用程序仍存在Flutter引擎上，但与平台view分离');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('应用的生命周期'),
      ),
      body: Center(
        child: Obx(() => Text('$_stateStr')),
      ),
    );
  }
}
