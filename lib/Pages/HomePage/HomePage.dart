import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/searchBar.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/AttentionPage.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/RecommendPage.dart';
import 'package:flutter_zhihu_app/Blocs/attentionPage_bloc.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/VideoPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  final _tabs = [
    Text('关注', style: TextStyle(fontSize: 16)),
    Text('推荐', style: TextStyle(fontSize: 16)),
    Text('热榜', style: TextStyle(fontSize: 16)),
    Text('视频', style: TextStyle(fontSize: 16)),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);

    attentionPageBloc.goRecStream.listen((index) {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: SearchBar(
            searchBarText: '虐童事件',
            rightIcon: Icon(Icons.keyboard,color: Colors.blue),
            rightBtnText: '提问',
            searchOnPressed: () {},
            requestOnPressed: () {},
          ),
          bottom: PreferredSize(
              child: TabBar(
                labelPadding: EdgeInsets.only(bottom: 5),
                indicatorColor: Colors.black,
                tabs: _tabs,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
              preferredSize: Size(MediaQuery.of(context).size.width, 30)),
        ),
        body: TabBarView(
          children: <Widget>[
            AttentionPage(),
            RecommendPage(),
            Text('2'),
            Text('3'),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
