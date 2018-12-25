import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/MinePage/Widgets/CustomButton.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';
import 'package:flutter_zhihu_app/Widgets/seperateLine.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  buildNavigationBar() {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      middle: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: ShapeDecoration(
          color: AppTheme.color6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        height: 30,
        width: MediaQuery.of(context).size.width - 80,
        child: FlatButton.icon(
          textColor: AppTheme.color5,
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: AppTheme.color5,
          ),
          label: Text(
            '搜索知乎内容',
          ),
        ),
      ),
      trailing: GestureDetector(
        child: Icon(Icons.print, color: AppTheme.color6),
        onTap: () {
          print(1);
        },
      ),
    );
  }

  buildUnLoginView() {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: AppTheme.color6,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 30, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '登录知乎，体验更多功能',
            style: AppTheme.textStyleFont18Weight700,
          ),
          SizedBox(height: 10),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: () {},
                      child: Image.asset('assets/group_ic_wechat_nor.png'))),
              Expanded(
                  child: FlatButton(
                      onPressed: () {},
                      child: Image.asset('assets/group_ic_wechat_nor.png'))),
              Expanded(
                  child: FlatButton(
                      onPressed: () {},
                      child: Image.asset('assets/group_ic_wechat_nor.png'))),
              Expanded(
                  child: FlatButton(
                      onPressed: () {},
                      child: Image.asset('assets/group_ic_wechat_nor.png'))),
            ],
          ),
          SizedBox(height: 10),
          Text('其他方式登录',
              style: TextStyle(fontSize: 13, color: AppTheme.color7)),
        ],
      ),
    );
  }

  buildTopViewItem(String count, String text, VoidCallback onTap) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Text(count, style: AppTheme.textStyleFont18Weight700),
          Text(text, style: TextStyle(fontSize: 13)),
        ],
      ),
      onTap: onTap,
    );
  }

  buildTopView() {
    Widget line = Container(width: 1, height: 30, color: AppTheme.color6);

    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(child: buildTopViewItem('5', '我关注的', () {})),
        Expanded(child: buildTopViewItem('5', '收藏夹', () {})),
        Expanded(child: buildTopViewItem('5', '最近浏览', () {})),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildNavigationBar(),
      child: Container(
        margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight - 6),
        child: ListView(
          children: <Widget>[
            SeperateLine(),
            buildUnLoginView(),
            SizedBox(height: 20),
            buildTopView(),
            SeperateLine(),
            Material(
              child: ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('我的书架'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
