import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画组件记录'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10, bottom: ScreenUtil().bottomBarHeight),
      child: Column(
        children: <Widget>[
          buildListFirst(),
          ASSizeBox(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '隐式动画组件：只需提供给组件动画开始、结束值，组件创建 AnimationController、Curve、Tween，执行动画，释放AnimationController，我们称之为隐式动画组件，隐式动画组件有： AnimatedAlign、AnimatedContainer、AnimatedDefaultTextStyle、AnimatedOpacity、AnimatedPadding、AnimatedPhysicalModel、AnimatedPositioned、AnimatedPositionedDirectional、AnimatedTheme、SliverAnimatedOpacity、TweenAnimationBuilder、AnimatedContainer 等',
              maxLines: 10,
            ),
          ),
          ASSizeBox(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '显示动画组件：需要设置 AnimationController，控制动画的执行，使用显式动画可以完成任何隐式动画的效果，甚至功能更丰富一些，不过你需要管理该动画的 AnimationController 生命周期，AnimationController 并不是一个控件，所以需要将其放在 stateful 控件中。显示动画组件有：AlignTransition、AnimatedBuilder、AnimatedModalBarrier、DecoratedBoxTransition、DefaultTextStyleTransition、PositionedTransition、RelativePositionedTransition、RotationTransition、ScaleTransition、SizeTransition、SlideTransition 、FadeTransition 等',
              maxLines: 20,
            ),
          ),
          ASSizeBox(),
          buildListLast(),
        ],
      ),
    );
  }

  Widget buildListFirst() {
    final list = <String>[
      '1. 创建 AnimationController',
      '2. 监听 AnimationController，调用 setState 刷新UI',
      '3. 释放 AnimationController'
    ];
    return buildListView(list, 40.0);
  }

  Widget buildListLast() {
    final list = <String>[
      '1. 判断你的动画组件是否一直重复，比如一直转圈的loading动画，如果是选择显式动画',
      '2. 判断你的动画组件是否需要多个组件联动，如果是选择显式动画',
      '3. 判断你的动画组件是否需要组合动画，如果是选择显式动画',
      '4. 上面三个条件为否，选择隐式动画组件，判断是否已经内置动画组件，如果没有，使用 TweenAnimationBuilder，有就直接使用内置动画组件',
      '5. 选择显式动画组件，判断是否已经内置动画组件，如果没有，使用 AnimatedBuilder，有就直接使用内置动画组件'
    ];
    return buildListView(list, 70.0);
  }

  Widget buildListView(List<String> list, double height) {
    if (list.isEmpty) {
      return SizedBox(
        height: 10,
      );
    }
    return Container(
      height: height * list.length,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              list[index],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        itemCount: list.length,
        itemExtent: height,
      ),
    );
  }
}
