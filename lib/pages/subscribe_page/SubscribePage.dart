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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("订阅"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            tooltip: 'favorite',
            onPressed: () => debugPrint('Search button is pressed.'),
          ),

          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'settings',

            onPressed: () => showSearch(context: null, delegate: null) /*Navigator.of(context).push(
            )*/),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Text("body"),
              RaisedButton(
                child: Text("点击"),
              )
            ],
          ),

        ],
      ),
    );
  }

}