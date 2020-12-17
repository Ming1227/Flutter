import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_group.dart';
import 'package:flutter_change_theme/common/common_item.dart';
import 'package:flutter_change_theme/constant/as_color.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/providers/theme_info_providers.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';
import 'package:flutter_change_theme/widgets/bar_button/bar_button.dart';
import 'package:flutter_change_theme/widgets/common/common_group_widget.dart';
import 'package:provider/provider.dart';

class SelectColorPage extends StatefulWidget {
  final String value;
  SelectColorPage({Key key, this.value}) : super(key: key);

  @override
  _SelectColorPageState createState() => _SelectColorPageState();
}

class _SelectColorPageState extends State<SelectColorPage> {
  List dataSource = [];

  CommonRadioItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择主题'),
        leading: Container(
          padding: EdgeInsets.only(left: ScreenAdapter.width(15)),
          alignment: Alignment.centerLeft,
          child: BarButton(
            '取消',
            textColor: Theme.of(context).accentColor,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: ScreenAdapter.width(15)),
            alignment: Alignment.centerRight,
            child: BarButton(
              '完成',
              textColor: Theme.of(context).dividerColor,
              highlightTextColor: Colors.white.withOpacity(0.5),
              disabledTextColor: Colors.white.withOpacity(0.3),
              color: Theme.of(context).accentColor,
              highlightColor: Colors.purple,
              disabledColor: Colors.blue.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                vertical: ScreenAdapter.height(4),
                horizontal: ScreenAdapter.width(10),
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(ScreenAdapter.width(4))),
              enabled: true,
              onTap: () {
                /// 处理事件
                sureSelected();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).dividerColor,
        child: _buildChildWidget(context),
      ),
    );
  }

  Widget _buildChildWidget(BuildContext context) {
    return ListView.builder(
      itemCount: dataSource.length,
      itemBuilder: (context, index) {
        return CommonGroupWidget(
          group: dataSource[index],
        );
      },
    );
  }

  void sureSelected() {
    var colorKey = _selectedItem.title;
    print('颜色的key值：$colorKey');
    SpUtil.putString(Constant.colorKey, colorKey);
    Provider.of<ThemeInfoProvider>(context, listen: false)
        .setThemeColor(colorKey);
  }

  void _getData() {
    final items = <CommonItem>[];
    for (var i = 0; i < ASColor.datas.keys.length; i++) {
      var colorKey = ASColor.datas.keys.elementAt(i);
      var item = CommonRadioItem(
        title: colorKey,
        onTap: _itemOnTap,
        value: colorKey == widget.value,
      );
      if (item.title == widget.value) {
        _selectedItem = item;
      }
      items.add(item);
    }

    var group = CommonGroup(
      items: items,
    );

    setState(() {
      dataSource = [group];
    });
  }

  void _itemOnTap(CommonItem item) {
    final radio = item as CommonRadioItem;
    if (_selectedItem == null) {
      setState(() {
        radio.value = true;
        _selectedItem = radio;
      });
    } else {
      if (_selectedItem == radio) {
        setState(() {
          radio.value = false;
          _selectedItem = null;
        });
      } else {
        setState(() {
          _selectedItem.value = false;
          radio.value = true;
          _selectedItem = radio;
        });
      }
    }
  }
}
