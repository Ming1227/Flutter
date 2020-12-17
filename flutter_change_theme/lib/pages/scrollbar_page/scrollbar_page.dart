import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/scrollbar_page/as_scrollbar.dart';

class ScrollBarPage extends StatefulWidget {
  @override
  _ScrollBarPageState createState() => _ScrollBarPageState();
}

class _ScrollBarPageState extends State<ScrollBarPage> {
  double _alignmentY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动条'),
      ),
      // body: Container(
      //   child: buildChild(),
      //   color: Theme.of(context).primaryColor,
      // ),
      body: buildChildWidget(context),
    );
  }

  /* 默认滚动条 */
  Widget buildChild() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 30,
        itemExtent: 50,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              color: Theme.of(context).accentColor,
              height: 45,
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          );
        },
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final metrics = notification.metrics;
    print('滚动组件最大滚动距离:${metrics.maxScrollExtent}');
    print('当前滚动位置:${metrics.pixels}');
    setState(() {
      _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
    });
    return true;
  }

  /* 自定义滚动条 */
  Widget buildChildWidget(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: 30,
            itemExtent: 50,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  color: Theme.of(context).accentColor,
                ),
              );
            },
          ),
          Container(
            alignment: Alignment(1, _alignmentY),
            padding: EdgeInsets.only(right: 5),
            child: ASScrollbar(),
          ),
        ],
      ),
    );
  }
}
