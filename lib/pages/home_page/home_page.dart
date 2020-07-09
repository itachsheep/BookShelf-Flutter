import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> items = new List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
