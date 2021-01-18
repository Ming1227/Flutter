import 'package:flutter/material.dart';
import 'package:flutter_get_demo/home_view.dart';
import 'package:flutter_get_demo/messages.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.fade,
      translations: Messages(),
      home: HomeView2(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData.dark(),
    ),
  );
}
