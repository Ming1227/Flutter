import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/as_color.dart';
import 'package:flutter_change_theme/home_page.dart';
import 'package:flutter_change_theme/pages/as_pageview_page/as_pageview_page.dart';
import 'package:flutter_change_theme/pages/basic_widget_page/basic_widget_page.dart';
import 'package:flutter_change_theme/pages/container_size_page/container_size_page.dart';
import 'package:flutter_change_theme/pages/cylinder_chart/cylinder_chart.dart';
import 'package:flutter_change_theme/pages/expand_page/expand_page.dart';
import 'package:flutter_change_theme/pages/flow_page/flow_page.dart';
import 'package:flutter_change_theme/pages/function_type/date_picker_page/date_picker_page.dart';
import 'package:flutter_change_theme/pages/gesture_page/gesture_page.dart';
import 'package:flutter_change_theme/pages/gridview_page/gridview_page.dart';
import 'package:flutter_change_theme/pages/listview_page/listview_page.dart';
import 'package:flutter_change_theme/pages/nested_scrollview_page/nested_scrollview_page.dart';
import 'package:flutter_change_theme/pages/page_view_page/page_view_page.dart';
import 'package:flutter_change_theme/pages/scrollbar_page/scrollbar_page.dart';
import 'package:flutter_change_theme/pages/sliver_appbar/sliver_appbar.dart';
import 'package:flutter_change_theme/pages/sliver_list_grid/sliver_list_grid_page.dart';
import 'package:flutter_change_theme/pages/sliver_persistent_head/sliver_persistent_head.dart';
import 'package:flutter_change_theme/pages/stack_page/stack_page.dart';
import 'package:flutter_change_theme/pages/text_page/text_page.dart';
import 'package:flutter_change_theme/pages/wrap_page/wrap_page.dart';
import 'package:flutter_change_theme/providers/theme_info_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

Color _themeColor;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeInfoProvider()),
      ],
      child: Consumer<ThemeInfoProvider>(
        builder: (context, themeInfo, child) {
          String colorKey = themeInfo.themeColor;
          if (colorKey.isEmpty) {
            colorKey = 'white';
          }
          final map = ASColor.datas[colorKey];
          if (map['theme'] != null) {
            _themeColor = map['theme'];
          }
          final accentColor = map['accent'];
          final bgColor = map['background'];
          final titleColor = map['title'];
          final subTitleColor = map['subTitle'];
          final bodyColor = map['body'];
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: _themeColor,
              accentColor: accentColor,
              cardColor: _themeColor,
              dividerColor: bgColor,
              backgroundColor: bgColor,
              buttonTheme: ButtonThemeData(
                buttonColor: accentColor,
                minWidth: 44,
              ),
              textTheme: TextTheme(
                  headline6: TextStyle(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle2: TextStyle(
                    color: subTitleColor,
                    fontSize: 16,
                  ),
                  bodyText1: TextStyle(
                    color: bodyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                  )),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: _themeColor),
            ),
            // home: MyHomePage(title: 'Flutter Theme Change demo'),
            routes: {
              '/': (context) => MyHomePage(),
              'text_page': (context) => TextPage(),
              'basic_page': (context) => BasicWidgetPage(),
              'stack_page': (context) => StackPage(),
              'wrap_page': (context) => WrapPage(),
              'flow_page': (context) => FlowPage(),
              'container_page': (context) => ContainerSizePage(),
              'expand_page': (context) => ExpandPage(),
              'cylinder_chart_page': (context) => CylinderChartPage(),
              'gesture_page': (context) => GesturePage(),
              'listview_page': (context) => ListViewPage(),
              'gridview_page': (context) => GridViewPage(),
              'pageview_page': (context) => PageViewPage(),
              'as_pageview_page': (context) => ASPageViewPage(),
              'scrollbar_page': (context) => ScrollBarPage(),
              'sliver_list_grid_page': (context) => SliverListGridPage(),
              'sliver_appbar_page': (context) => SliverAppBarPage(),
              'sliver_persistent_head_page': (context) =>
                  SliverPersistentHeadPage(),
              'nested_scrollview_page': (context) => NestedScrollViewPage(),
              'datePicker_page': (context) => ASDataPickerPage(),
            },
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (context) {
                String routeName = settings.name;
                return Text('未注册$routeName');
              });
            },
          );
        },
      ),
    );
  }
}
