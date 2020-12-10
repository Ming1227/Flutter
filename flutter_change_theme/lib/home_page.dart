import 'package:flustars/flustars.dart' hide ScreenUtil;
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/common/common_footer.dart';
import 'package:flutter_change_theme/common/common_group.dart';
import 'package:flutter_change_theme/common/common_header.dart';
import 'package:flutter_change_theme/common/common_item.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/pages/basic_widget_page/basic_widget_page.dart';
import 'package:flutter_change_theme/pages/container_size_page/container_size_page.dart';
import 'package:flutter_change_theme/pages/cylinder_chart/cylinder_chart.dart';
import 'package:flutter_change_theme/pages/expand_page/expand_page.dart';
import 'package:flutter_change_theme/pages/flow_page/flow_page.dart';
import 'package:flutter_change_theme/pages/gesture_page/gesture_page.dart';
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
    getData();
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

    CommonGroup group0 = CommonGroup(
      items: [item0, item1],
    );

    CommonCenterItem item3 = CommonCenterItem(
      title: '叠加组件Stack',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return StackPage();
        }));
      },
    );

    CommonCenterItem item4 = CommonCenterItem(
      title: '流式组件Wrap',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WrapPage();
        }));
      },
    );

    CommonCenterItem item40 = CommonCenterItem(
      title: '自定义组件Flow',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FlowPage();
        }));
      },
    );

    CommonGroup group1 = CommonGroup(
      items: [item3, item4, item40],
      header: CommonHeader(header: 'section1 header'),
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

    CommonItem item60 = CommonItem(
      title: '柱状图',
      subTitle: '实例',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CylinderChartPage();
        }));
      },
    );

    CommonGroup group2 = CommonGroup(
      items: [item5, item6, item60],
      headerHeight: 10.0,
      footer: CommonFooter(footer: 'section2 footer'),
    );

    // CommonImageItem item7 = CommonImageItem(
    //   imageUrl:
    //       'http://tva3.sinaimg.cn/crop.0.6.264.264.180/93276e1fjw8f5c6ob1pmpj207g07jaa5.jpg',
    //   title: '7',
    //   width: 66.0,
    //   height: 66.0,
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 16,
    //     vertical: 8,
    //   ),
    // );

    // CommonImageItem item8 = CommonImageItem(
    //   imageUrl: 'assets/images/About_WeChat_AppIcon_64x64.png',
    //   title: '8',
    //   width: 32.0,
    //   height: 32.0,
    // );
    CommonItem item7 = CommonItem(
      title: '手势组件',
      subTitle: 'GestureDetector、InkWell、Listener',
      onTap: (item) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return GesturePage();
        }));
      },
    );

    CommonGroup group3 = CommonGroup(
      items: [item7],
    );

    CommonRadioItem item9 = CommonRadioItem(
      title: '9',
      value: false,
      onTap: (item) {},
    );

    CommonRadioItem item10 = CommonRadioItem(
      title: '10',
      value: true,
      onTap: (item) {},
    );

    CommonGroup group4 = CommonGroup(
      items: [item9, item10],
      headerHeight: 10.0,
    );

    CommonBtnItem item11 = CommonBtnItem(
      title: '11',
      btnTitle: '随便吧',
      btnTap: (item) {
        print('点击了item11中的按钮');
      },
      onTap: (item) {
        print('点击了item11');
      },
    );

    CommonGroup group5 = CommonGroup(
      items: [item11],
      headerHeight: 10.0,
    );

    setState(() {
      dataSource = [group0, group1, group2, group3, group4, group5];
    });
  }
}
