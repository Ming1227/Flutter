import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_header.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';

class CommonHeaderWidget extends StatelessWidget {
  final CommonHeader header;

  CommonHeaderWidget({Key key, this.header}) : super(key: key);

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

  Widget _buildChildWidget(BuildContext context) {
    if (header is CommonHeader) {
      return _buildCommonHeader(context, header);
    }
    return null;
  }

  Widget _buildCommonHeader(BuildContext context, CommonHeader header) {
    return Container(
      width: double.maxFinite,
      child: Text(
        header.header,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
