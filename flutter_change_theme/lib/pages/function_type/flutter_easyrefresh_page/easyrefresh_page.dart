import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyRefreshPage extends StatefulWidget {
  @override
  _EasyRefreshPageState createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  int _count = 20;
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('easyrefresh'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _controller.callRefresh();
            },
            child:
                Text('Refresh', style: Theme.of(context).textTheme.subtitle2)),
        FlatButton(
            onPressed: () {
              _controller.callLoad();
            },
            child: Text('Load more',
                style: Theme.of(context).textTheme.bodyText1)),
      ],
    );
  }

  Widget buildChildWidget(BuildContext context) {
    // return buildEasyRefresh(context);
    return buildEasyRefreshCustom(context);
  }

  Widget buildEasyRefresh(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  '$index',
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Theme.of(context).primaryColor,
              child: SizedBox(
                height: 2,
              ),
            );
          },
          itemCount: _count),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count = 20;
          });
          _controller.resetLoadState();
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _count += 10;
          });
          _controller.finishLoad(noMore: _count >= 50);
        });
      },
    );
  }

  Widget buildEasyRefreshCustom(BuildContext context) {
    return EasyRefresh.custom(
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      controller: _controller,
      header: ClassicalHeader(
        refreshReadyText: '开始刷新',
        refreshText: '刷新',
        refreshingText: '刷新中',
        refreshedText: '刷新完成',
        refreshFailedText: '刷新失败',
      ),
      footer: ClassicalFooter(
        noMoreText: '无更多数据',
      ),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          print('onRefresh');
          setState(() {
            _count = 20;
          });
          _controller.resetLoadState();
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          print('onLoad');
          setState(() {
            _count += 10;
          });
          _controller.finishLoad(noMore: _count >= 40);
        });
      },
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 60,
                width: 60,
                child: Center(
                  child: Text('$index'),
                ),
                color: index % 2 == 0 ? Colors.green : Colors.amber,
              );
            },
            childCount: _count,
          ),
        ),
      ],
    );
  }
}
