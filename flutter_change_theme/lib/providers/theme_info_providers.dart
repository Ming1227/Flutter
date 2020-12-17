import 'package:flutter/material.dart';

class ThemeInfoProvider extends ChangeNotifier {
  String _themeColor = '';
  String get themeColor => _themeColor;

  int _themeFontSize = 16;
  int get themeFontSize => _themeFontSize;

  void setThemeColor(String themeColor) {
    if (_themeColor != themeColor) {
      print('监听颜色主题变化$themeColor');
      _themeColor = themeColor;
      notifyListeners();
    }
  }

  void setThemeFontSize(int fontSize) {
    if (_themeFontSize != fontSize) {
      print('监听字体大小变化');
      _themeFontSize = fontSize;
      notifyListeners();
    }
  }
}
