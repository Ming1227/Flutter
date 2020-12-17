import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef CommonGestureTapCallback = void Function(CommonItem item);
typedef CommonBtnTapCallback = void Function(CommonItem item);

class CommonItem {
  final String icon;
  final Color iconColor;
  final String title;
  final String subTitle;
  final Color titleColor;
  final Color subTitleColor;
  final bool tapHighlight;
  final EdgeInsetsGeometry padding;
  final CommonGestureTapCallback onTap;

  /// 构建函数
  CommonItem({
    this.icon,
    this.iconColor,
    this.title = '',
    this.subTitle = '',
    this.titleColor,
    this.subTitleColor,
    this.tapHighlight = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
    this.onTap,
  });
}

class CommonCenterItem extends CommonItem {
  CommonCenterItem(
      {String title, Color titleColor, CommonGestureTapCallback onTap})
      : super(
          title: title,
          titleColor: titleColor,
          onTap: onTap,
        );
}

class CommonSwitchItem extends CommonItem {
  final String cacheKey;
  // 取值
  Future<bool> getOn() async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getBool(cacheKey);
    return value ?? false;
  }

  // 存值
  void setOn(bool value) async {
    var sp = await SharedPreferences.getInstance();
    await sp.setBool(cacheKey, value);
  }

  CommonSwitchItem({String title, String icon, @required this.cacheKey})
      : assert(
            (cacheKey.isNotEmpty && cacheKey != null), 'You must set cacheKey'),
        super(title: title, icon: icon, tapHighlight: false);
}

class CommonRadioItem extends CommonItem {
  bool value;

  /// 默认未选中
  CommonRadioItem(
      {String title, this.value = false, CommonGestureTapCallback onTap})
      : super(title: title, onTap: onTap);
}

class CommonBtnItem extends CommonItem {
  final CommonBtnTapCallback btnTap;
  final String btnTitle;

  CommonBtnItem(
      {String title,
      this.btnTitle,
      this.btnTap,
      CommonGestureTapCallback onTap})
      : super(title: title, onTap: onTap);
}

class CommonImageItem extends CommonItem {
  final double width;
  final double height;
  final String imageUrl;
  final bool isNetwork;

  CommonImageItem(
      {String title,
      @required this.imageUrl,
      this.width,
      this.height,
      this.isNetwork = false,
      EdgeInsetsGeometry padding})
      : super(
          title: title,
          padding: padding ?? EdgeInsets.all(Constant.pEdgeInset),
        );
}
