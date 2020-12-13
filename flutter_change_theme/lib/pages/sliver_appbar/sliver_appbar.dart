import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
      color: Theme.of(context).primaryColor,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '复仇者联盟',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 24.0,
                ),
              ),
              background: Image.network(
                'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Text(
                      '$index',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              },
              childCount: 30,
            ),
            itemExtent: 80.0,
          ),
        ],
      ),
    );
  }
}
