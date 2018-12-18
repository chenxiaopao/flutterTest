import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/HomePage//HomePage.dart';
import 'package:flutter_zhihu_app/Pages/IdeaPage//IdeaPage.dart';
import 'package:flutter_zhihu_app/Pages/CollegePage//CollegePage.dart';
import 'package:flutter_zhihu_app/Pages/MessagePage//MessagePage.dart';
import 'package:flutter_zhihu_app/Pages/MinePage//MinePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  final _pages = [
    HomePage(),
    IdeaPage(),
    CollegePage(),
    MessagePage(),
    MinePage(),
  ];

  final _items = [
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('想法')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('大学')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('消息')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: _items),
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context){
              return  _pages[index];
            },);
          }),
    );
  }
}
