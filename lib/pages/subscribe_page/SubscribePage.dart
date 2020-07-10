import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubScribePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SubScribeState();
  }
}

class _SubScribeState extends State<SubScribePage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            Text("订阅主页"),
            RaisedButton(
              child: Text("点击"),
            )
          ],
        ),

      ],
    );
  }

}