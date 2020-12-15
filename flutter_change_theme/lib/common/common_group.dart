import 'package:flutter_change_theme/common/common_footer.dart';
import 'package:flutter_change_theme/common/common_header.dart';
import 'package:flutter_change_theme/common/common_item.dart';

class CommonGroup {
  final CommonHeader header;

  final CommonFooter footer;

  final double headerHeight;

  final double footerHeight;

  final List<CommonItem> items;

  CommonGroup({
    this.header,
    this.headerHeight = 10.0,
    this.footer,
    this.footerHeight = 10.0,
    this.items = const <CommonItem>[],
  });
}
