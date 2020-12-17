import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_footer.dart';
import 'package:flutter_change_theme/common/common_group.dart';
import 'package:flutter_change_theme/common/common_header.dart';
import 'package:flutter_change_theme/common/common_item.dart';
import 'package:flutter_change_theme/utils/as_utils.dart';
import 'package:flutter_change_theme/widgets/common/common_footer_widget.dart';
import 'package:flutter_change_theme/widgets/common/common_header_widget.dart';
import 'package:flutter_change_theme/widgets/common/common_item_widget.dart';

class CommonGroupWidget extends StatefulWidget {
  final CommonGroup group;
  CommonGroupWidget({Key key, this.group}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CommonGroupWidgetState();
  }
}

class CommonGroupWidgetState extends State<CommonGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerBuilder(widget.group.header),
        _itemBulider(widget.group.items),
        _footerBuilder(widget.group.footer),
      ],
    );
  }

  /// 构建item
  Widget _itemBulider(List items) {
    final boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(color: Color(0xFFD8D8D8), width: 0.5),
        bottom: BorderSide(color: Color(0xFFD8D8D8), width: 0.5),
      ),
    );

    final count = items.length;
    var children = <Widget>[];
    for (var i = 0; i < count; i++) {
      final CommonItem item = items[i];
      var offstagIcon = ASUtils.isEmptyString(item.icon);
      var indent = offstagIcon ? 16.0 : 16.0 + 30.0 + 16.0;
      Widget child = CommonItemWidget(
        item: item,
      );
      if (i != 0 && count > 1) {
        children.add(Divider(
          height: 0.5,
          color: Color(0xFFD8D8D8),
          indent: indent,
        ));
      }
      children.add(child);
    }

    return Container(
      decoration: boxDecoration,
      child: Column(
        children: children,
      ),
    );
  }

  Widget _headerBuilder(CommonHeader header) {
    return header == null
        ? SizedBox(
            width: double.maxFinite,
            height: widget.group.headerHeight,
            child: Container(
              color: Theme.of(context).dividerColor,
            ),
          )
        : CommonHeaderWidget(
            header: header,
          );
  }

  Widget _footerBuilder(CommonFooter footer) {
    return null == footer
        ? SizedBox(
            width: double.maxFinite,
            height: widget.group.footerHeight,
          )
        : CommonFooterWidget(
            footer: footer,
          );
  }
}
