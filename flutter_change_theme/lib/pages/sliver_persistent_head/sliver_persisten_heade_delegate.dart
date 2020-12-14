import 'package:flutter/material.dart';

class ASSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).accentColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2.0,
            backgroundColor: Colors.yellow,
          ),
          Text(
            '这是一个SliverPersistentHeader',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
