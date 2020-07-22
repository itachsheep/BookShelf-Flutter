import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:legado_flutter/HttpUtil.dart';
import 'package:legado_flutter/models/SubscribeData.dart';
import 'package:legado_flutter/pages/subscribe_page/RssSortPage.dart';
import 'package:legado_flutter/utils/logutils.dart';


final String TAG = "RssPage";
class RssPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _RssPageState();
  }
}

class _RssPageState extends State<RssPage> {
  List<SubscribeData> subScribeData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var url = "https://gitee.com/alanskycn/yuedu/raw/master/JS/RSS/rssSource";
    var response = await HttpUtil.getInstance().get(url);//get(url,data: {"cid": cid});
    //var encoded = json.decode(response);
    var item = SubscribeDataUtil.getFromJson(response);
    subScribeData.addAll(item);
    setState(() {});
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
          LogUtils.d(TAG, "index: " + index.toString()
              + ", length: " + subScribeData.length.toString());
          SubscribeData item = subScribeData[index];
          return buildItem(item);
        });
  }

  Widget buildItem(SubscribeData data) {
    return new GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> RssSortPage(data.sourceUrl))
      ),
      child: Padding(
            padding: EdgeInsets.all(10.0),
            child:new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Image.network(
                data.sourceIcon,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),

              Text(
                data.sourceName,
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0
                ),
              ),

            ],)
          ),
    );
  }
}