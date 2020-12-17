import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/flow_page/flow_circle_delegate.dart';
import 'package:flutter_change_theme/pages/flow_page/flow_menu_delegate.dart';
import 'package:flutter_change_theme/pages/flow_page/simple_flow_delegate.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowPageState createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> with TickerProviderStateMixin {
  AnimationController _popMenu;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = [
    Icons.home,
    Icons.notifications,
    Icons.new_releases,
    Icons.settings,
    Icons.menu,
  ];

  AnimationController _circleAn;

  @override
  void initState() {
    super.initState();
    _popMenu = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _circleAn = AnimationController(
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 80,
      vsync: this,
    );
    _circleAn.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _popMenu.dispose();
    _circleAn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组件Flow'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChild(),
      ),
    );
  }

  Widget buildChild() {
    return Column(
      children: [
        ASSizeBox(),
        buildFlow1(),
        ASSizeBox(),
        buildFlow2(),
        ASSizeBox(),
        buildFlow3(),
        ASSizeBox(),
      ],
    );
  }

  Widget buildFlow1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Flow(
        delegate: SimpleFlowDelegate(),
        children: List.generate(
          5,
          (index) {
            return Container(
              alignment: Alignment.topCenter,
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildFlow2() {
    return Container(
      height: 100,
      color: Theme.of(context).accentColor,
      child: Flow(
        delegate: FlowMenuDelegate(animation: _popMenu),
        children:
            menuItems.map((IconData icon) => buildMenuItem(icon)).toList(),
      ),
    );
  }

  Widget buildMenuItem(IconData icon) {
    final buttonFlex =
        MediaQuery.of(context).size.width * 2 / menuItems.length / 3;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: RawMaterialButton(
          fillColor: lastTapped == icon ? Colors.amber[700] : Colors.yellow,
          splashColor: Colors.amber[100],
          shape: CircleBorder(),
          constraints: BoxConstraints.tight(Size(buttonFlex, buttonFlex)),
          child: Icon(
            icon,
            color: Colors.purple,
            size: 30.0,
          ),
          onPressed: () {
            _updateMenu(icon);
          }),
    );
  }

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() {
        lastTapped = icon;
      });
    } else {
      _popMenu.status == AnimationStatus.completed
          ? _popMenu.reverse()
          : _popMenu.forward();
    }
  }

  Widget buildFlow3() {
    return Container(
      color: Theme.of(context).accentColor,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Flow(
              delegate: FlowCircleDelegate(_circleAn.value),
              children: buidlFlow3Children(),
            ),
          ),
          Positioned.fill(
            child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    _circleAn.status == AnimationStatus.completed
                        ? _circleAn.reverse()
                        : _circleAn.forward();
                  });
                }),
          ),
        ],
      ),
    );
  }

  List<Widget> buidlFlow3Children() {
    return List.generate(
      5,
      (index) => Container(
        child: Icon(
          index.isEven ? Icons.timer : Icons.ac_unit,
          color: Colors.primaries[index % Colors.primaries.length],
        ),
      ),
    );
  }
}
