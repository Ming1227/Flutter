import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverListGridPage extends StatefulWidget {
  @override
  _SliverListGridPageState createState() => _SliverListGridPageState();
}

class _SliverListGridPageState extends State<SliverListGridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverListGrid'),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
        color: Theme.of(context).primaryColor,
        child: buildChild(context),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverGrid(),
        buildSliverList(),
      ],
    );
  }

  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            height: 55,
            color: Colors.primaries[index % (Colors.primaries.length)],
            child: Text(
              '$index',
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        },
        childCount: 30,
      ),
    );
  }

  Widget buildSliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Text(
              '$index',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        },
        childCount: 12,
      ),
    );
  }
}
