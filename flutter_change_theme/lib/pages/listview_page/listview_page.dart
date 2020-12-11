import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/listview_page/listview_item.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        print('${_controller.position}');
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView组件'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChild(),
      ),
    );
  }

  Widget buildChild() {
    return Container(
      color: Theme.of(context).accentColor,
      // child: ListView(
      //   children: List.generate(
      //     10,
      //     (index) => ListViewItem(
      //       title: index.toString(),
      //     ),
      //   ).toList(),
      // ),
      child: Column(
        children: [
          Container(
            child: RaisedButton(
              child: Text('滚动到指定位置'),
              onPressed: () {
                /* 滚动距离 */
                _controller.animateTo(50.0 * 6,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: _controller,
              itemBuilder: (context, index) {
                return ListViewItem(
                  title: '$index',
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
