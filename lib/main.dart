import 'package:flutter/material.dart';
import 'package:legado_flutter/models/user_model.dart';
import 'package:legado_flutter/pages/personal_page/PersonalPage.dart';
import 'package:legado_flutter/pages/search_page/SearchPage.dart';
import 'package:legado_flutter/pages/home_page/home_page.dart';
import 'package:legado_flutter/pages/subscribe_page/SubscribePage.dart';
import 'package:legado_flutter/utils/logutils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<User>(
        create: (context) => User(),
      )
    ],
    child: MyApp(),
  ));
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
  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        children: <Widget>[
          Home(),
          SearchPage(),
          SubScribePage(),
          PersonalPage()
        ],
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.home),
              title: Text('Home')),
          BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.business),
              title: Text('Business')),
          BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.school),
              title: Text('School')),
          BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.restaurant),
              title: Text('Restaurant')),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black87,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(index) {
    _pageController.jumpToPage(index);
    LogUtils.d(TAG, "_onItemTapped index: " + index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
