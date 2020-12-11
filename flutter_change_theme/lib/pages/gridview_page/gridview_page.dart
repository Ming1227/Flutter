import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView组件'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChild(),
      ),
    );
  }

  Widget buildChild() {
    return Container(
      color: Colors.yellow,
      // child: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 5,
      //     mainAxisSpacing: 5,
      //   ),
      //   children: List.generate(
      //       8, (index) => createGridViewItem(Colors.primaries[index])).toList(),
      // ),
      // child: gridViewbuider(),
      // child: gridViewCustom(),
      child: gridViewCount(),
      // child: gridViewExtent(),
    );
  }

  Widget createGridViewItem(Color color) {
    return Container(
      height: 80,
      color: color,
    );
  }

  /// GridView 快速构建方式
  /// GridView.builder
  Widget gridViewbuider() {
    return Container(
      color: Colors.yellow,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        itemCount: 30,
      ),
    );
  }

  /// GridView.custom
  Widget gridViewCustom() {
    return Container(
      color: Colors.yellow,
      child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 50,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            },
            childCount: 30,
          )),
    );
  }

  /// GridView.count
  Widget gridViewCount() {
    return Container(
      color: Colors.yellow,
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(
            30,
            (index) => Container(
                  height: 50,
                  color: Colors.primaries[index % Colors.primaries.length],
                )),
      ),
    );
  }

  /// GridView.extent
  Widget gridViewExtent() {
    return Container(
      color: Colors.yellow,
      child: GridView.extent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
            30,
            (index) => Container(
                  height: 80,
                  color: Colors.primaries[index % Colors.primaries.length],
                )),
      ),
    );
  }
}
