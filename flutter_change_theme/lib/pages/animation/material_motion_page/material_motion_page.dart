import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/constant/constant.dart';
import 'package:flutter_change_theme/pages/animation/material_motion_page/material_motion_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialMotionPage extends StatefulWidget {
  @override
  _MaterialMotionPageState createState() => _MaterialMotionPageState();
}

class _MaterialMotionPageState extends State<MaterialMotionPage> {
  final _duration = Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: OpenContainer(
          closedBuilder: (context, action) {
            return Container(
              width: ScreenUtil().screenWidth,
              height: 45,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green.withOpacity(.5),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.search,
                color: Theme.of(context).accentColor,
              ),
            );
          },
          openBuilder: (context, action) {
            return MaterialMotionDetailPage();
          },
          transitionDuration: _duration,
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(context),
      ),
      floatingActionButton: OpenContainer(
        closedBuilder: (context, action) {
          return SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          return MaterialMotionDetailPage();
        },
        transitionDuration: _duration,
        closedElevation: 5.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        closedColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget buildChildWidget(BuildContext context) {
    return buildListView();
  }

  Widget buildListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionDuration: _duration,
          closedBuilder: (context, action) {
            return ListTile(
              title: Text('$index'),
              leading: Icon(Icons.add),
            );
          },
          openBuilder: (context, action) {
            return MaterialMotionDetailPage();
          },
        );
      },
      itemCount: 8,
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionDuration: _duration,
          closedBuilder: (context, action) {
            return Container(
              child: Image.asset(
                Constant.others + 'other_1.jpg',
                fit: BoxFit.fitWidth,
              ),
            );
          },
          openBuilder: (context, action) {
            return MaterialMotionDetailPage();
          },
        );
      },
      itemCount: 6,
    );
  }
}
