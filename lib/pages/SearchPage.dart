import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            Text("输入框------------"),
            RaisedButton(
              child: Text("点击"),
            )
          ],
        ),

        Text('起点中文网'),
        Text('E文学'),
      ],
    );
  }

}