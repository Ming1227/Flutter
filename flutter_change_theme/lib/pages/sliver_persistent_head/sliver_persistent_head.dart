import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_change_theme/pages/sliver_persistent_head/sliver_persisten_heade_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverPersistentHeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PersistentHead组件'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          // pinned: true,
          floating: true,
          delegate: ASSliverPersistentHeaderDelegate(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                height: 60,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            },
            childCount: 30,
          ),
        ),
      ],
    );
  }
}
