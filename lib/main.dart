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
  int currentPosition = 0;
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
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(Icons.home),
            title: Text('主页')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(Icons.business),
            title: Text('搜索')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(Icons.school),
            title: Text('订阅')
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            icon: Icon(Icons.restaurant),
            title: Text('我')
        ),
      ],
      currentIndex: currentPosition,
      backgroundColor: Colors.black87,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );

    return new Scaffold(
      body: pageData[currentPosition],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  void _onItemTapped(index) {
    LogUtils.d(TAG, "_onItemTapped index: " + index.toString());
    setState(() {
      currentPosition = index;
    });
  }
}
