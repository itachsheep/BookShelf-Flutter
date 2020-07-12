import 'package:flutter/material.dart';
import 'package:legado_flutter/models/user_model.dart';
import 'package:legado_flutter/pages/personal_page/PersonalPage.dart';
import 'package:legado_flutter/pages/search_page/SearchPage.dart';
import 'package:legado_flutter/pages/home_page/home_page.dart';
import 'package:legado_flutter/pages/subscribe_page/SubscribePage.dart';
import 'package:legado_flutter/utils/logutils.dart';
import 'package:provider/provider.dart';

void main() {
  /*runApp(MultiProvider(
    providers: [
      Provider<User>(
        create: (context) => User(),
      )
    ],
    child: MyApp(),
  ));*/
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TAG = "_MyHomePageState";
  int _selectedIndex = 0;
  BottomNavigationBarType animType = BottomNavigationBarType.fixed;

  List<Widget> pageData;

  @override
  void initState() {
    super.initState();
    pageData = new List();
    pageData..add(Home())
      ..add(SearchPage())
      ..add(SubScribePage())
      ..add(PersonalPage());
  }

  @override
  Widget build(BuildContext context) {
    final BottomAppBar bottomNavigationBar = new BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: _selectedIndex == 0 ? Colors.red : Colors.grey,
            onPressed: (){
              _onItemTapped(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: _selectedIndex == 1 ? Colors.red : Colors.grey,
            onPressed: (){
              _onItemTapped(1);
            },
          ),

          //SizedBox(width: 50,),

          IconButton(
            icon: Icon(Icons.photo_filter),
            color: _selectedIndex == 2 ? Colors.red : Colors.grey,
            onPressed: (){
              _onItemTapped(2);
            },
          ),
          IconButton(
            icon: Icon(Icons.face),
            color: _selectedIndex == 3 ? Colors.red : Colors.grey,
            onPressed: (){
              _onItemTapped(3);
            },
          ),
        ],
      ),
    );

    return new Scaffold(
      body: pageData[_selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  void _onItemTapped(index) {
    LogUtils.d(TAG, "_onItemTapped index: " + index.toString());
    setState(() {
      _selectedIndex = index;
    });
  }
}
