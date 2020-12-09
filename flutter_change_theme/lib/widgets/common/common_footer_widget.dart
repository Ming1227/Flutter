import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_footer.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';

class CommonFooterWidget extends StatelessWidget {
  const CommonFooterWidget({Key key, this.footer}) : super(key: key);
  final CommonFooter footer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Constant.pEdgeInset,
        ScreenAdapter.height(5),
        Constant.pEdgeInset,
        ScreenAdapter.height(5),
      ),
      child: _buildChildWidget(context),
      color: Theme.of(context).dividerColor,
    );
  }

  /// 生成child小部件
  Widget _buildChildWidget(BuildContext context) {
    if (footer is CommonFooter) {
      return _buildCommonFooter(context, footer);
    }
    return null;
  }

  /// 生成 common header
  Widget _buildCommonFooter(BuildContext context, CommonFooter footer) {
    return Container(
      width: double.maxFinite,
      child: Text(footer.footer, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
