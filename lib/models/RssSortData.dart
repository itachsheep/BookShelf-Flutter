class RssSortData {
  String name;
  String description;
  String link;
  List<ItemData> items;

  RssSortData.fromJson(Map<String,dynamic> json) {
    name = json['name'];
    description = json['description'];
    link = json['link'];
    if(json['list'] != null) {
      items = new List<ItemData>();
      json['list'].forEach((v) {
        items.add(new ItemData.fromJson(v));
      });
    }

  }

}
class ItemData {
  String title;
  String url;
  String pic;
  String time;

  ItemData.fromJson(Map<String,dynamic> json){
    title = json['title'];
    url = json['url'];
    pic = json['pic'];
    time = json['time'];
  }
}