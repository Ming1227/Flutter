import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MyLocale {
  ch,
  es,
}

class HomeController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  var _myLocale = MyLocale.es;

  updateLocale() {
    var locale;
    if (_myLocale == MyLocale.es) {
      locale = Locale('zh', 'CN');
      _myLocale = MyLocale.ch;
    } else {
      locale = Locale('en', 'US');
      _myLocale = MyLocale.es;
    }
    Get.updateLocale(locale);
  }

  updateTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  @override
  void onInit() {
    super.onInit();
    print('HomeController->onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('HomeController->onReady');
  }

  @override
  void onClose() {
    super.onClose();
    print('HomeController->onClose');
  }
}
