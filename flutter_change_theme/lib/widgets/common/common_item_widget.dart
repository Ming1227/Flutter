import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_item.dart';
import 'package:flutter_change_theme/utils/as_utils.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';

class CommonItemWidget extends StatefulWidget {
  final CommonItem item;
  CommonItemWidget({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CommonItemWidgetState();
  }
}

class CommonItemWidgetState extends State<CommonItemWidget> {
  /// 是否允许点击高亮
  bool _highlight = false;

  /// 开关控件的状态
  bool _lights = false;

  @override
  void initState() {
    super.initState();
    if (widget.item is CommonSwitchItem) {
      final switchItem = widget.item as CommonSwitchItem;
      switchItem.getOn().then((value) {
        setState(() {
          _lights = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final CommonItem item = widget.item;
    return GestureDetector(
      onTapDown: item.tapHighlight ? _handleTapDown : null,
      onTap: _handleOnTap,
      onTapCancel: item.tapHighlight ? _handleTapCancel : null,
      onTapUp: item.tapHighlight ? _handleTapUp : null,
      child: Container(
        color: _highlight
            ? Theme.of(context).primaryColor
            : Theme.of(context).dividerColor,
        child: _buildChildWidget(),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleOnTap() {
    if (widget.item.onTap != null && widget.item.onTap is Function) {
      widget.item.onTap(widget.item);
    }
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  Widget _buildChildWidget() {
    final item = widget.item;

    Widget child;

    if (item is CommonCenterItem) {
      child = _buildCenterItem(item);
    } else if (item is CommonSwitchItem) {
      child = _buildSwitchItem(item);
    } else if (item is CommonRadioItem) {
      child = _buildRadioItem(item);
    } else if (item is CommonImageItem) {
      child = _buildImageItem(item);
    } else if (item is CommonBtnItem) {
      child = _buildBtnItem(item);
    } else if (item is CommonItem) {
      child = _buildItem(item);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: ScreenAdapter.height(56),
      ),
      child: Container(
        padding: item.padding,
        child: child,
      ),
    );
  }

  /// 构建item组件
  Widget _buildItem(CommonItem item) {
    bool offstageIcon = ASUtils.isEmptyString(item.icon);
    Widget iconWidget = Offstage(
      offstage: offstageIcon,
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonIconWidget(item.icon,
            iconColor: Theme.of(context).accentColor),
      ),
    );

    Widget titleWidget = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonTextWidget(
          item.title,
          fontSize: ScreenAdapter.sp(18),
        ),
      ),
    );

    Widget subtitleWidget = Offstage(
      offstage: ASUtils.isEmptyString(item.subTitle),
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
        child: _buildCommonSubTextWidget(
          item.subTitle,
          fontSize: ScreenAdapter.sp(16),
        ),
      ),
    );

    Widget arrowWidget = _buildCommonRightArrowWidget();

    return Row(
        children: [iconWidget, titleWidget, subtitleWidget, arrowWidget]);
  }

  /// 构建居中文本 组件
  Widget _buildCenterItem(CommonCenterItem item) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildCommonTextWidget(
            item.title,
            fontSize: ScreenAdapter.sp(18),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  /// 构建 switch组件
  Widget _buildSwitchItem(CommonSwitchItem item) {
    bool offstageIcon = ASUtils.isEmptyString(item.icon);
    Widget iconWidget = Offstage(
      offstage: offstageIcon,
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonIconWidget(item.icon,
            iconColor: Theme.of(context).accentColor),
      ),
    );

    Widget titleWidget = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonTextWidget(
          item.title,
          fontSize: ScreenAdapter.sp(18),
        ),
      ),
    );

    Widget switchWidget = CupertinoSwitch(
      value: _lights,
      activeColor: Theme.of(context).accentColor,
      trackColor: Theme.of(context).backgroundColor,
      onChanged: (bool value) {
        item.setOn(value);
        setState(() {
          _lights = value;
        });
      },
    );

    return Row(
      children: <Widget>[
        iconWidget,
        titleWidget,
        switchWidget,
      ],
    );
  }

  /// 构建 单选 item
  Widget _buildRadioItem(CommonRadioItem item) {
    Widget titleWidgt = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonTextWidget(
          item.title,
          fontSize: ScreenAdapter.sp(18),
        ),
      ),
    );

    bool offstageIcon = !item.value;
    Widget iconWidget = Offstage(
      offstage: offstageIcon,
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
        child: _buildCommonIconWidget(
          'assets/images/icon_selected_20x20.png',
          width: ScreenAdapter.width(20),
          height: ScreenAdapter.width(20),
        ),
      ),
    );

    return Row(children: [titleWidgt, iconWidget]);
  }

  /// 返回图片item
  Widget _buildImageItem(CommonImageItem item) {
    Widget titleWidget = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonTextWidget(
          item.title,
          fontSize: ScreenAdapter.sp(18),
        ),
      ),
    );

    Widget arrowWidget = _buildCommonRightArrowWidget();

    bool offstageIcon = ASUtils.isEmptyString(item.imageUrl);
    Widget iconWidget = Offstage(
      offstage: offstageIcon,
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
        child: _buildCommonIconWidget(
          item.imageUrl,
          width: item.width,
          height: item.height,
        ),
      ),
    );
    return Row(children: [titleWidget, iconWidget, arrowWidget]);
  }

  /// 构建IconWidget
  Widget _buildCommonIconWidget(
    String url, {
    Color iconColor,
    double width = 24.0,
    double height = 24.0,
  }) {
    final isEmpty = ASUtils.isEmptyString(url);
    if (isEmpty) {
      return null;
    }
    final isNetwork = url.startsWith(RegExp(r'^http'));
    Widget iconWidget;
    if (isNetwork) {
      iconWidget = CachedNetworkImage(
        imageUrl: url,
        width: ScreenAdapter.width(width),
        height: ScreenAdapter.height(height),
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(
            'assets/images/default_100x100.png',
            width: ScreenAdapter.width(width),
            height: ScreenAdapter.height(height),
          );
        },
        errorWidget: (context, url, error) {
          print('$error');
          return Image.asset(
            'assets/images/default_100x100.png',
            width: ScreenAdapter.width(width),
            height: ScreenAdapter.height(height),
          );
        },
      );
    } else {
      iconWidget = Image.asset(
        url,
        width: ScreenAdapter.width(width),
        height: ScreenAdapter.height(height),
        color: iconColor,
      );
    }
    return iconWidget;
  }

  Widget _buildBtnItem(CommonBtnItem item) {
    Widget titleWidget = Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: ScreenAdapter.width(16)),
        child: _buildCommonTextWidget(
          item.title,
          fontSize: ScreenAdapter.sp(18),
        ),
      ),
    );

    Widget btnWidget = Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenAdapter.width(15),
        vertical: ScreenAdapter.height(5),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          if (item.btnTap != null && item.btnTap is Function) {
            item.btnTap(item);
          }
        },
        child: Text(
          item.btnTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );

    Widget arrowWidget = _buildCommonRightArrowWidget();

    return Row(children: [titleWidget, btnWidget, arrowWidget]);
  }

  /// 构建文本组件
  Widget _buildCommonTextWidget(
    String text, {
    double fontSize = 18.0,
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
      textAlign: textAlign,
      maxLines: 2,
    );
  }

  /// 构建文本组件
  Widget _buildCommonSubTextWidget(
    String text, {
    double fontSize = 16.0,
    TextAlign textAlign = TextAlign.right,
  }) {
    return Container(
      width: ScreenAdapter.width(200),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  /// 构建rightArrowIcon
  Widget _buildCommonRightArrowWidget() {
    return Image.asset(
      'assets/images/tableview_arrow_8x13.png',
      width: ScreenAdapter.width(8),
      height: ScreenAdapter.height(13),
    );
  }
}
