import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:legado_flutter/models/RssSortData.dart';
import 'package:legado_flutter/utils/logutils.dart';

final String TAG = "ReadRssPage";
class ReadRssPage extends StatefulWidget {
  ItemData data;
  ReadRssPage(this.data):super();
  @override
  State<StatefulWidget> createState() {
    return new ReadRssPageState(data);
  }
}

class ReadRssPageState extends State<ReadRssPage> {
  ItemData data;
  ReadRssPageState(this.data):super();

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
        url: data.url,
        appBar: AppBar(
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
          title: Text(data.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star, color: Colors.white,),
              //将搜索内容置为空
              onPressed: () => LogUtils.d(TAG, "11"),
            ),

            IconButton(
              icon: Icon(Icons.share,color: Colors.white,),
            ),

            IconButton(
              icon: Icon(Icons.volume_up,color: Colors.white,),
            ),
          ],
        ),
    );
  }

}