import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legado_flutter/models/SubscribeData.dart';
import 'package:legado_flutter/utils/logutils.dart';

final String TAG = "SubScribePage";
class SubScribePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SubScribeState();
  }
}

class _SubScribeState extends State<SubScribePage> {
  List<SubscribeData> subScribeData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var url = "https://gitee.com/alanskycn/yuedu/raw/master/JS/RSS/rssSource";
    
  }

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
            onPressed: () => LogUtils.d(TAG,"111"),/*Navigator.of(context).push(
            )*/),
        ],
      ),
      body: subScribeData.length == 0 ?
          SpinKitCircle(
            itemBuilder: (_,int index){
              return DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey
                ),
              );
            },
          ) :
          buildListView(context),
    );
  }


  ListView buildListView(BuildContext context) {
    return new ListView.builder(
        itemCount: subScribeData.length,
        itemBuilder: (context,index){
          SubscribeData item = subScribeData[index];
          return buildItem(item);
        });
  }

  Widget buildItem(SubscribeData data) {
    return new GestureDetector(
      onTap: () => LogUtils.d(TAG, "go to next page"),
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
          ),

          Image.network(
            data.sourceIcon,
            fit: BoxFit.cover,
            width: 100,
            height: 125,
          ),
        ],
      ),
    );
  }
}