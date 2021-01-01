import 'package:flutter/material.dart';
import 'package:first_harry/first_harry.dart';

class ASTabBarPage extends StatefulWidget {
  @override
  _ASTabBarPageState createState() => _ASTabBarPageState();
}

class _ASTabBarPageState extends State<ASTabBarPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabValues = [
    '足球',
    '篮球',
    '羽毛球',
    '乒乓球',
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabValues.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          tabs: _tabValues.map((f) {
            return Text(f);
          }).toList(),
          controller: _tabController,
          indicatorColor: Colors.red,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 5.0,
          labelStyle: TextStyle(height: 2),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabValues.map((f) {
          return Center(
            child: Column(
              children: [
                setupASTabBar(),
                ASSizeBox(),
                setupASTabBarOther(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget setupASTabBar() {
    return ASTabBar(
      tabs: List.generate(
        _tabValues.length,
        (index) {
          if (index == 1) {
            return Row(
              children: [
                Icon(Icons.sports_basketball),
                SizedBox(
                  width: 5,
                ),
                Text(_tabValues[index]),
              ],
            );
          }
          return Text(_tabValues[index]);
        },
      ),
      indicatorColor: Colors.yellow,
      selectedColor: Colors.green,
      unselectedColor: Colors.blue,
      indicatorHeight: 10.0,
      height: 100,
      initSelectedIndex: 1,
    );
  }

  Widget setupASTabBarOther() {
    return ASTabBarOther(
      tabs: List.generate(
        _tabValues.length,
        (index) {
          if (index == 1) {
            return Row(
              children: [
                Icon(Icons.sports_basketball),
                SizedBox(
                  width: 5,
                ),
                Text(_tabValues[index]),
              ],
            );
          }
          return Text(_tabValues[index]);
        },
      ),
      indicatorColor: Colors.yellow,
      selectedColor: Colors.green,
      unselectedColor: Colors.blue,
      indicatorHeight: 10.0,
      height: 100,
      initSelectedIndex: 1,
    );
  }
}
