import 'package:flutter/material.dart';

class ASColor {
  // static const Map<String, Color> themeColorMap = {
  //   'gray': Colors.grey,
  //   'blue': Colors.blue,
  //   'blueAccent': Colors.blueAccent,
  //   'cyan': Colors.cyan,
  //   'deepPurple': Colors.purple,
  //   'deepPurpleAccent': Colors.deepPurpleAccent,
  //   'deepOrange': Colors.orange,
  //   'green': Colors.green,
  //   'indigo': Colors.indigo,
  //   'indigoAccent': Colors.indigoAccent,
  //   'orange': Colors.orange,
  //   'purple': Colors.purple,
  //   'pink': Colors.pink,
  //   'red': Colors.red,
  //   'teal': Colors.teal,
  //   'black': Colors.black,
  // };

  static const Map<String, Map> datas = {
    'white': {
      'theme': Colors.white,
      'accent': Colors.blue,
      'background': Colors.white,
      'title': Colors.black,
      'subTitle': Colors.black26,
      'body': Colors.black87,
    },
    'black': {
      'theme': Colors.black,
      'accent': Colors.green,
      'background': Colors.black,
      'title': Colors.white,
      'subTitle': Colors.white24,
      'body': Colors.white70,
    },
    'blue': {
      'theme': Colors.blue,
      'accent': Colors.purple,
      'background': Colors.blue,
      'title': Colors.black,
      'subTitle': Colors.white24,
      'body': Colors.white70,
    },
    'red': {
      'theme': Colors.red,
      'accent': Colors.teal,
      'background': Colors.red,
      'title': Colors.white,
      'subTitle': Colors.black26,
      'body': Colors.black87,
    },
  };
}
