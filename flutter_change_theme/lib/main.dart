import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/as_color.dart';
import 'package:flutter_change_theme/home_page.dart';
import 'package:flutter_change_theme/providers/theme_info_providers.dart';
import 'package:provider/provider.dart';

import 'package:first_harry/first_harry.dart';

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
          var colorKey = themeInfo.themeColor;
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
            // debugShowMaterialGrid: true,
            // showPerformanceOverlay: true,
            theme: ThemeData(
              primaryColor: _themeColor,
              accentColor: accentColor,
              cardColor: _themeColor,
              dividerColor: bgColor,
              backgroundColor: bgColor,
              buttonTheme: ButtonThemeData(
                buttonColor: accentColor,
                minWidth: 60,
              ),
              textTheme: TextTheme(
                  headline6: TextStyle(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle1: TextStyle(
                    color: titleColor,
                    fontSize: 16,
                  ),
                  subtitle2: TextStyle(
                    color: subTitleColor,
                    fontSize: 16,
                  ),
                  bodyText1: TextStyle(
                    color: bodyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                  ),
                  bodyText2: TextStyle(
                    color: titleColor,
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
              'basic_page': (context) => BasicPageZero(),
              'basic_page_one': (context) => BasicPageOne(),
              'basic_page_two': (context) => BasicPageTwo(),
              'as_from_page': (context) => ASFromPage(),
              'datatable_page': (context) => DataTablePage(),
              'draggable_page': (context) => DraggablePage(),
              'stack_page': (context) => StackPage(),
              'wrap_page': (context) => WrapPage(),
              'flow_page': (context) => FlowPage(),
              'container_page': (context) => ContainerSizePage(),
              'expand_page': (context) => ExpandPage(),
              'cylinder_chart_page': (context) => CylinderChartPage(),
              'gesture_page': (context) => GesturePage(),
              'listview_page': (context) => ListViewPage(),
              'expansionpanellist_page': (context) => ExpansionPanelListPage(),
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
              'timePicker_page': (context) => TimePickerPage(),
              'pop_menu_page': (context) => PopMenuPage(),
              'easy_caculator_page': (context) => CaculatorPage(),
              'easyrefresh_page': (context) => EasyRefreshPage(),
              'basic_animation_page': (context) => BasicAnimationPage(),
              'interval_animation_page': (context) => IntervalAnimationPage(),
              'record_animation_page': (context) => RecordAnimationPage(),
              'list_animation_page': (context) => ListAnimationPage(),
              'hero_animation_page': (context) => HeroAnimationPage1(),
              'material_mation_page': (context) => MaterialMotionPage(),
              'curved_animation_page': (context) => CurvedAnimationPage(),
            },
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (context) {
                var routeName = settings.name;
                return Text('未注册$routeName');
              });
            },
          );
        },
      ),
    );
  }
}
