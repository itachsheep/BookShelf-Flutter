import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legado_flutter/utils/logutils.dart';

import 'Assets.dart';

final String TAG = "SearchPage";

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SearchPageState();
  }
}

class MyEditorTextController extends TextEditingController {}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 30, maxWidth: 400),
          child: new TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
              hintText: '筛选发现',
              hintStyle: new TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              // contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: /*Color(0xffaaaaaa)*/ Colors.lightBlue,
            ),
            onTap: () {
              showSearch(context: context, delegate: SearchBarDelegate(
                searchFieldLabel: "筛选发现"
              ));
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () => debugPrint('Search button is pressed.'),
          ),
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {

  SearchBarDelegate({String searchFieldLabel,
    TextInputType keyboardType,
    TextInputAction textInputAction}):super(
      searchFieldLabel:searchFieldLabel,
      keyboardType:keyboardType,
      textInputAction:textInputAction
  );

  @override
  ThemeData appBarTheme(BuildContext context) {
    //return super.appBarTheme(context);
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
    );
    //theme.inputDecorationTheme.hintStyle = TextStyle();

    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.blue,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
      hintColor: Colors.white,
      inputDecorationTheme: inputDecorationTheme
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        //将搜索内容置为空
        onPressed: () => query = "",
      )
    ];
  }

  //重写返回图标
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        //关闭上下文，当前页面
        onPressed: () => close(context, null));
  }

  //重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ));
  }
}
