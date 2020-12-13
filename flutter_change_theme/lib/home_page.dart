import 'dart:convert';

import 'package:flustars/flustars.dart' hide ScreenUtil;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_change_theme/common/common_group.dart';
import 'package:flutter_change_theme/common/common_header.dart';
import 'package:flutter_change_theme/common/common_item.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/models/home_model/home_model_group.dart';
import 'package:flutter_change_theme/pages/basic_widget_page/basic_widget_page.dart';
import 'package:flutter_change_theme/pages/container_size_page/container_size_page.dart';
import 'package:flutter_change_theme/pages/cylinder_chart/cylinder_chart.dart';
import 'package:flutter_change_theme/pages/expand_page/expand_page.dart';
import 'package:flutter_change_theme/pages/flow_page/flow_page.dart';
import 'package:flutter_change_theme/pages/gesture_page/gesture_page.dart';
import 'package:flutter_change_theme/pages/gridview_page/gridview_page.dart';
import 'package:flutter_change_theme/pages/listview_page/listview_page.dart';
import 'package:flutter_change_theme/pages/page_view_page/page_view_page.dart';
import 'package:flutter_change_theme/pages/scrollbar_page/scrollbar_page.dart';
import 'package:flutter_change_theme/pages/sliver_list_grid/sliver_list_grid_page.dart';
import 'package:flutter_change_theme/pages/stack_page/stack_page.dart';
import 'package:flutter_change_theme/pages/text_page/text_page.dart';
import 'package:flutter_change_theme/pages/wrap_page/wrap_page.dart';
import 'package:flutter_change_theme/select_color/select_color_page.dart';
import 'package:flutter_change_theme/utils/screen_adapter.dart';
import 'package:flutter_change_theme/widgets/common/common_group_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CommonGroup> dataSource = [];

  @override
  void initState() {
    // getData();
    getJsonData();
    super.initState();
    WidgetUtil widgetUtil = new WidgetUtil();
    widgetUtil.asyncPrepares(true, (_) async {
      await SpUtil.getInstance();
    });
  }

  void _init() {
    ScreenAdapter.init(context);
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
      appBar: AppBar(
        title: Text('切换主题Demo'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: ScreenAdapter.width(15)),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      String temp = SpUtil.getString(Constant.colorKey);
                      return SelectColorPage(
                        value: temp,
                      );
                    },
                  ),
                );
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

  void getJsonData() async {
    rootBundle.loadString('jsondatas/homepage.json').then((jsonStr) {
      final List homepageJson = json.decode(jsonStr);

      homepageJson.forEach((json) {
        final HomeModelGroup modelGroup = HomeModelGroup.fromJson(json);
        List<CommonItem> items = modelGroup.items.map((e) {
          CommonItem comItem = CommonItem(
            title: e.title,
            subTitle: e.subTitle,
            tapHighlight: e.tapHighlight,
            icon: e.iconStr,
            onTap: (item) {
              Navigator.pushNamed(context, e.pageRouter);
            },
          );
          return comItem;
        }).toList();
        CommonGroup group = CommonGroup(
          items: items,
          header: CommonHeader(header: modelGroup.header),
        );
        dataSource.add(group);
      });

      setState(() {});
    });
  }

  void getData() {
    CommonItem item0 = CommonItem(
      title: '文本组件',
      subTitle: 'text、RichText、TextField',
      icon: 'assets/images/football_check.png',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return TextPage();
          },
        ));
      },
    );

    CommonGroup group0 = CommonGroup(
      items: [item0],
      header: CommonHeader(header: '文本组件'),
    );

    CommonItem item1 = CommonItem(
      title: '基础组件',
      subTitle: 'Button、Switch、Progress',
      icon: 'assets/images/basketball_check.png',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return BasicWidgetPage();
        }));
      },
    );

    CommonGroup group1 = CommonGroup(
      items: [item1],
      header: CommonHeader(header: '基础组件'),
    );

    CommonItem item2 = CommonItem(
      title: '叠加组件',
      subTitle: 'Stack、IndexedStack',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return StackPage();
        }));
      },
    );
    CommonItem item3 = CommonItem(
      title: '流式组件',
      subTitle: 'Wrap',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WrapPage();
        }));
      },
    );

    CommonItem item4 = CommonItem(
      title: '自定义组件',
      subTitle: 'Flow',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FlowPage();
        }));
      },
    );

    CommonGroup group2 = CommonGroup(
      items: [item2, item3, item4],
      header: CommonHeader(header: '布局组件'),
    );

    CommonItem item5 = CommonItem(
      title: '定位装饰组件',
      subTitle: 'Container',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ContainerSizePage();
        }));
      },
    );

    CommonItem item6 = CommonItem(
      title: '权重组件',
      subTitle: 'Flexible、Expand、Spacer',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ExpandPage();
        }));
      },
    );

    CommonItem item7 = CommonItem(
      title: '柱状图',
      subTitle: '实例',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CylinderChartPage();
        }));
      },
    );

    CommonGroup group3 = CommonGroup(
      items: [item5, item6, item7],
      header: CommonHeader(header: '定位装饰权重组件'),
      // footer: CommonFooter(footer: 'section2 footer'),
    );

    CommonItem item8 = CommonItem(
      title: '手势组件',
      subTitle: 'GestureDetector、InkWell、Listener',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return GesturePage();
        }));
      },
    );

    CommonGroup group4 = CommonGroup(
      items: [item8],
      header: CommonHeader(header: '手势识别组件'),
    );

    CommonItem item9 = CommonItem(
      title: 'ListView组件',
      subTitle: 'ListView',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ListViewPage();
        }));
      },
    );

    CommonItem item10 = CommonItem(
      title: 'GridView组件',
      subTitle: 'GridView',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return GridViewPage();
        }));
      },
    );

    CommonItem item11 = CommonItem(
      title: 'PageView组件',
      subTitle: 'PageView',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PageViewPage();
        }));
      },
    );

    CommonItem item12 = CommonItem(
      title: '滚动条组件',
      subTitle: 'scrollbar',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ScrollBarPage();
        }));
      },
    );

    CommonGroup group5 = CommonGroup(
      items: [item9, item10, item11, item12],
      header: CommonHeader(header: '滚动和大数据组件'),
    );

    CommonItem item13 = CommonItem(
      title: 'SliverList/SliverGrid',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SliverListGridPage();
        }));
      },
    );

    CommonGroup group6 = CommonGroup(
      items: [item13],
      header: CommonHeader(header: 'Sliver系列组件'),
    );

    setState(() {
      dataSource = [group0, group1, group2, group3, group4, group5, group6];
    });
  }
}
