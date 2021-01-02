import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/as_scrollbehavior.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  var _mFuture;

  @override
  void initState() {
    super.initState();
    _mFuture = _future();
  }

  Future _future() async {
    return Future.delayed(Duration(seconds: 3), () {
      // return Future.error('');
      return 'json Data';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步任务'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        // child: buildChildWidget(),
        child: buildChildListWidget(),
      ),
    );
  }

  Widget buildChildListWidget() {
    return FutureBuilder(
      future: _mFuture,
      builder: (context, snapshot) {
        var widget;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            widget = _loadingErrorWidget();
          } else {
            widget = _setupDataWidget();
          }
        } else {
          widget = _loadingWidget();
        }
        return widget;
      },
    );
  }

  Widget _setupDataWidget() {
    return ScrollConfiguration(
      behavior: ASScrollBehavior(),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            child: ListTile(
              title: Text(
                '$index',
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                '$index',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: Icon(Icons.arrow_right),
              leading: Icon(Icons.person),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.amber,
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _loadingErrorWidget() {
    return Center(
      child: Text('数据加载失败，请重试！'),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildChildWidget() {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), () {
        // return 'success';
        return Future.error('outTime');
      }),
      builder: (context, snapshot) {
        var widget;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            widget = Icon(
              Icons.error,
              color: Colors.red,
              size: 48,
            );
          } else {
            widget = Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 36,
            );
          }
        } else {
          widget = Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: widget,
          ),
        );
      },
    );
  }
}
