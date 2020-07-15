import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:legado_flutter/utils/logutils.dart';

final String TAG = "SubscribeDataUtil";
class SubscribeDataUtil {
  static List<SubscribeData> getFromJson(List<dynamic> json) {
    if (json == null) {
      throw Exception('json is null');
    }
    List<SubscribeData> datas =
        json.map((v) => new SubscribeData.fromJson(v)).toList();
    return datas;
  }
}

class SubscribeData {
  String sourceUrl;
  String sourceName;
  String sourceIcon;
  String sourceGroup;
  bool enabled;
  String sortUrl;
  int articleStyle;

  //列表规则
  String ruleArticles;
  String ruleNextPage;
  String ruleTitle;
  String rulePubDate;

  //webView规则
  String ruleDescription;
  String ruleImage;
  String ruleLink;
  String ruleContent;
  String style;
  String header;
  bool enableJs;
  bool loadWithBaseUrl;
  int customOrder;

  SubscribeData.fromJson(Map<String,dynamic> json) {
    customOrder = json['customOrder'];
    loadWithBaseUrl = json['loadWithBaseUrl'];
    enabled = json['enabled'];
    //sortUrl = json['sortUrl'];
    ruleArticles = json['ruleArticles'];
    ruleContent = json['ruleContent'];
    ruleImage = json['ruleImage'];
    ruleLink = json['ruleLink'];
    rulePubDate = json['rulePubDate'];
    ruleTitle = json['ruleTitle'];
    sourceUrl = json['sourceUrl'];
    sourceName = json['sourceName'];
    sourceIcon = json['sourceIcon'];
    sourceGroup = json['sourceGroup'];
  }
}