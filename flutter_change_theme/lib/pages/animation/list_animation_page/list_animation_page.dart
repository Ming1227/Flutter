import 'package:flutter/material.dart';

class ListAnimationPage extends StatefulWidget {
  @override
  _ListAnimationPageState createState() => _ListAnimationPageState();
}

class _ListAnimationPageState extends State<ListAnimationPage>
    with SingleTickerProviderStateMixin {
  final List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    final _index = _list.length;
    _list.insert(_index, _index);
    _listKey.currentState.insertItem(_index);
  }

  void _removeItem() {
    final _index = _list.length - 1;
    var item = _list[_index].toString();
    _listKey.currentState.removeItem(
        _index, (context, animation) => _buildItem(item, animation));
    _list.removeAt(_index);
  }

  Widget _buildItem(String _item, Animation _animation) {
    // return SlideTransition(
    //   position: _animation
    //       .drive(CurveTween(curve: Curves.easeIn))
    //       .drive(Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 1))),
    //   child: Card(
    //     child: ListTile(
    //       title: Text(_item),
    //     ),
    //   ),
    // );
    return SizeTransition(
      sizeFactor: _animation,
      child: Card(
        color: Colors.green,
        child: ListTile(
          title: Text(
            _item,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text(_item + _item),
          leading: Icon(Icons.card_giftcard),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表动画'),
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            return _buildItem(_list[index].toString(), animation);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => _addItem(),
            child: Icon(
              Icons.add,
              color: Theme.of(context).accentColor,
            ),
            heroTag: 'list_add',
          ),
          SizedBox(
            width: 50,
          ),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: Icon(
              Icons.remove,
              color: Theme.of(context).accentColor,
            ),
            heroTag: 'list_remove',
          ),
        ],
      ),
    );
  }
}
