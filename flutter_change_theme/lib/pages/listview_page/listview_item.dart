import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String title;
  const ListViewItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
