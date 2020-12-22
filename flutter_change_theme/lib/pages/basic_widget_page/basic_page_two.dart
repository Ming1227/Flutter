import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_theme/widgets/sizebox/sizebox.dart';

class BasicPageTwo extends StatefulWidget {
  @override
  _BasicPageTwoState createState() => _BasicPageTwoState();
}

class _BasicPageTwoState extends State<BasicPageTwo> {
  var _rawChipSelected = false;
  var _selectIndex = 0;
  final _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标签'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Column(
      children: [
        ASSizeBox(),
        buildChildRow(),
        ASSizeBox(),
        buildChoiceChip(),
        ASSizeBox(),
        buildFilterChip(),
        ASSizeBox(),
        buildActionChip(),
      ],
    );
  }

  Widget buildActionChip() {
    return Container(
      color: Theme.of(context).accentColor,
      alignment: Alignment.center,
      child: ActionChip(
          avatar: Icon(
            Icons.ios_share,
            color: Colors.yellow,
          ),
          label: Text('原生弹列表'),
          onPressed: () {
            showCupertinoActionSheet();
          }),
    );
  }

  void showCupertinoActionSheet() async {
    var result = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('提示'),
          message: Text('是否要删除当前项?'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop('think');
              },
              child: Text('考虑一下'),
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop('delete');
              },
              child: Text(
                '删除',
                style: TextStyle(color: Colors.red),
              ),
              isDefaultAction: true,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop('cancel');
            },
            child: Text('取消'),
          ),
        );
      },
    );
    print('$result');
  }

  Widget buildFilterChip() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          Wrap(
            spacing: 10,
            children: List.generate(15, (index) {
              return FilterChip(
                label: Text('足球 $index'),
                selected: _filters.contains('$index'),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add('$index');
                    } else {
                      _filters.removeWhere((element) => element == '$index');
                    }
                  });
                },
              );
            }).toList(),
          ),
          Text('选中: ${_filters.join(',')}'),
        ],
      ),
    );
  }

  Widget buildChoiceChip() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).accentColor,
      child: Wrap(
        spacing: 5,
        // runSpacing: 5,
        children: List.generate(10, (index) {
          return ChoiceChip(
            label: Text('篮球 $index'),
            labelStyle: Theme.of(context).textTheme.bodyText1,
            selectedColor: Colors.amber,
            selected: _selectIndex == index,
            onSelected: (value) {
              setState(() {
                _selectIndex = index;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget buildChildRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          RawChip(
            avatar: Offstage(
              offstage: _rawChipSelected,
              child: CircleAvatar(
                child: Text('H'),
                backgroundColor: Colors.blue,
              ),
            ),
            label: Text('实况'),
            labelStyle: TextStyle(color: Colors.blue),
            elevation: 8,
            pressElevation: 10,
            shadowColor: Colors.white,
            deleteIcon: Icon(Icons.delete),
            deleteIconColor: Colors.red,
            deleteButtonTooltipMessage: '删除',
            selected: _rawChipSelected,
            onSelected: (value) {
              setState(() {
                _rawChipSelected = value;
              });
            },
            selectedColor: Colors.yellow,
            selectedShadowColor: Colors.amber,
            onDeleted: () {
              print('点击删除');
            },
          ),
          SizedBox(
            width: 10,
          ),
          Chip(label: Text('比分')),
          SizedBox(
            width: 10,
          ),
          InputChip(label: Text('最全的足球赛事信息')),
        ],
      ),
    );
  }
}
