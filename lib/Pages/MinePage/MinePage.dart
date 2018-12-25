import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/MinePage/Widgets/CustomButton.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';

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
        children: <Widget>[
          Text(
            '登录知乎，体验更多功能',
            style: AppTheme.textStyleFont18Weight700,
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(child: Icon(Icons.accessible)),
              Expanded(child: Icon(Icons.accessible)),
              Expanded(child: Icon(Icons.accessible)),
              Expanded(child: Icon(Icons.accessible)),
            ],
          ),
          Text(
            '其他方式登录',
            style: TextStyle(fontSize: 13, color: AppTheme.color7),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildNavigationBar(),
      child: ListView(
        children: <Widget>[
          buildUnLoginView(),
        ],
      ),
    );
  }
}
