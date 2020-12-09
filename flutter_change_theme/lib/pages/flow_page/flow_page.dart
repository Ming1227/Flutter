import 'package:flutter/material.dart';
import 'package:flutter_change_theme/pages/flow_page/simple_flow_delegate.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlowPage extends StatefulWidget {
  @override
  _FlowPageState createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
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
      ],
    );
  }

  Widget buildFlow1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Flow(
        delegate: SimpleFlowDelegate(),
        children: List.generate(
          8,
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
}
