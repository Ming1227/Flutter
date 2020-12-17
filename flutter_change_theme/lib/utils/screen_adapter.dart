import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double screenutil_scale = 3.0;

class ScreenAdapter {
  static void init(context) {
    /// 配置屏幕适配的 设计稿的宽度和高度(单位px)
    final designW = 1242.0;
    final designH = 2208.0;
    ScreenUtil.init(context, designSize: Size(designW, designH));
  }

  static double height(double value) {
    return ScreenUtil().setHeight(value * screenutil_scale);
  }

  static double width(double value) {
    return ScreenUtil().setWidth(value * screenutil_scale);
  }

  static double sp(double value) {
    return ScreenUtil().setSp(value * screenutil_scale);
  }
}
