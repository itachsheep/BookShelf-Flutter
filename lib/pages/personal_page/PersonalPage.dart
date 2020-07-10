import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PersonalState();
  }
}

class _PersonalState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            Text("个人主页"),
            RaisedButton(
              child: Text("点击"),
            )
          ],
        ),

      ],
    );
  }

}