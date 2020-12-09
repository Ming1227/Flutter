import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double screenutil_scale = 3.0;

class ScreenAdapter {
  static init(context) {
    /// 配置屏幕适配的 设计稿的宽度和高度(单位px)
    final double designW = 1242.0;
    final double designH = 2208.0;
    ScreenUtil.init(context, designSize: Size(designW, designH));
  }

  static height(double value) {
    return ScreenUtil().setHeight(value * screenutil_scale);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value * screenutil_scale);
  }

  static sp(double value) {
    return ScreenUtil().setSp(value * screenutil_scale);
  }
}
