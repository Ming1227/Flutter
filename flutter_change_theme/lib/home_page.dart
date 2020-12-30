import 'dart:convert';

import 'package:first_harry/first_harry.dart';
import 'package:flustars/flustars.dart' hide ScreenUtil;

import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/models/home_model/home_model_group.dart';
import 'package:flutter_change_theme/pages/select_color/select_color_page.dart';

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
    var widgetUtil = WidgetUtil();
    widgetUtil.asyncPrepares(true, (_) async {
      await SpUtil.getInstance();
    });
  }

  void _init() {
    ASScreenAdapter.init(context);
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(ASConstant.adhots + 'adhots_6.jpg'),
            ),
            ASSizeBox(),
            ListTile(
              tileColor: Colors.yellow,
              leading: Icon(Icons.check_box),
              title: Text('data1'),
              subtitle: Text('sub1'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ASSizeBox(),
            ListTile(
              tileColor: Colors.blue,
              leading: Icon(Icons.check_box),
              title: Text('data2'),
              subtitle: Text('sub2'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ASSizeBox(),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.check_box),
              title: Text('data3'),
              subtitle: Text('sub3'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ASSizeBox(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('切换主题Demo'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: ASScreenAdapter.width(15)),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      var temp = SpUtil.getString(Constant.colorKey);
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
    // await rootBundle
    //     .loadString(Constant.jsondatas + 'homepage.json')
    await DefaultAssetBundle.of(context)
        .loadString(Constant.jsondatas + 'homepage.json')
        .then((jsonStr) {
      final List homepageJson = json.decode(jsonStr);

      homepageJson.forEach((json) {
        final modelGroup = HomeModelGroup.fromJson(json);
        var items = modelGroup.items.map((e) {
          var comItem = CommonItem(
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
        var group = CommonGroup(
          items: items,
          header: (modelGroup.header == null || modelGroup.header.isEmpty)
              ? null
              : CommonHeader(header: modelGroup.header),
          footer: (modelGroup.footer == null || modelGroup.footer.isEmpty)
              ? null
              : CommonFooter(footer: modelGroup.footer),
        );
        dataSource.add(group);
      });

      setState(() {});
    });
  }
}
