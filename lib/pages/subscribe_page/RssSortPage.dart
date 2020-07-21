import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legado_flutter/HttpUtil.dart';
import 'package:legado_flutter/models/RssSortData.dart';
import 'package:legado_flutter/models/RssSortData.dart';
import 'package:legado_flutter/utils/logutils.dart';

final String TAG = "RssSortPage";

class RssSortPage extends StatefulWidget {
  String url;
  RssSortPage(this.url):super(){
    LogUtils.d(TAG, "RssSortPage url: " + url.toString());
  }

  @override
  State<StatefulWidget> createState() {
    return new RssSortPageState(url);
  }
}

class RssSortPageState extends State<RssSortPage> {
  String url;
  RssSortPageState(this.url):super();
  List<ItemData> list = [];

  @override
  void initState() {
    super.initState();
    LogUtils.d(TAG, "initState url: " + url.toString());
    getData();
  }

  void getData() async {
    var response = await HttpUtil.getInstance().get(url);
    var rssSortData = RssSortData.fromJson(response);
    if(rssSortData.items.length > 0) {
      list.addAll(rssSortData.items);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: IconButton(
          icon: Icon(
            Icons.arrow_back,color: Colors.white,),
          ),
          //关闭上下文，当前页面
          onPressed: () {
            Navigator.of(context)
              ..pop(null);
          }),
        title: new Text("Legado"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            //将搜索内容置为空
            onPressed: () => LogUtils.d(TAG, "11"),
          )
        ],
      ),
      body: list.length == 0 ? SpinKitCircle(
        itemBuilder: (_,int index){
          return DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey
            ),
          );
        },
      )
      : buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return new ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,_index) {
          var itemData = list[_index];
          return new GestureDetector(
            onTap: ()=> {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0.0),
              child: new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Text(itemData.title),
                      Text(itemData.time)
                    ],
                  ),
                  Image.network(itemData.pic,
                  width: 80,
                  height: 80,)
                ],
              ),
            ),
          );
        });
  }
}