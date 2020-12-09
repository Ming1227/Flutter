import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/as_color.dart';
import 'package:flutter_change_theme/home_page.dart';
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
            home: MyHomePage(title: 'Flutter Theme Change demo'),
          );
        },
      ),
    );
  }
}
