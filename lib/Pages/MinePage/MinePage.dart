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
  double overWidth = 100;

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
        color: AppTheme.color7,
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
              style: TextStyle(fontSize: 13, color: AppTheme.color4)),
        ],
      ),
    );
  }

  buildTopViewItem(String count, String text, VoidCallback onTap) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Text(count, style: AppTheme.textStyleFont18Weight700),
          Text(text, style: TextStyle(fontSize: 13)),
          SizedBox(height: 10),
        ],
      ),
      onTap: onTap,
    );
  }

  buildTopView() {
    Widget line = Container(width: 1, height: 20, color: AppTheme.color5);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(child: buildTopViewItem('5', '我关注的', () {})),
            Expanded(child: buildTopViewItem('5', '收藏夹', () {})),
            Expanded(child: buildTopViewItem('5', '最近浏览', () {})),
          ],
        ),
        Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.horizontal,
          children: <Widget>[line, line],
        ),
      ],
    );
  }

  buildMiddleView() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Icon(Icons.map),
              Expanded(child: Text('我的书架')),
              Icon(Icons.keyboard_arrow_right, color: AppTheme.color6),
            ],
          ),
        ),
        SeperateLine(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.horizontal,
            children: <Widget>[
              CustomButton(
                  text: '社区建设',
                  image: Image.asset('assets/index_ic_remind_sel.png')),
              CustomButton(
                  text: '反馈与帮助',
                  image: Image.asset('assets/index_ic_remind_sel.png')),
              CustomButton(
                  text: '夜间模式',
                  image: Image.asset('assets/index_ic_remind_sel.png')),
              CustomButton(
                  text: '设置',
                  image: Image.asset('assets/index_ic_remind_sel.png')),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  bool scrollNotificationHandler(ScrollNotification notification) {
    if (notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
      double width =
          (notification.metrics.pixels - notification.metrics.maxScrollExtent)
              .abs();

      if (width > overWidth) {

        print('松开进入');
      }
    }
  }

  buildBottomViewItem() {
    return Container(
      height: 160,
      color: AppTheme.color1,
      margin: EdgeInsets.only(left: 10, bottom: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: Row(
              children: <Widget>[
                Icon(Icons.map),
                Expanded(child: Text('视频制作')),
                Text('拍一个',
                    style: TextStyle(fontSize: 15, color: AppTheme.color6)),
                Icon(Icons.keyboard_arrow_right, color: AppTheme.color6),
              ],
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 100,
            child: NotificationListener(
              onNotification: scrollNotificationHandler,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Stack(
                    alignment: Alignment(2, 0),
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 300,
                          height: 100,
                          color: AppTheme.color6,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Image.asset('assets/group_bg_invite_nor.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Image.asset('assets/group_bg_invite_nor.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Image.asset('assets/group_bg_invite_nor.png',
                                fit: BoxFit.fill),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 80,
                            height: 100,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                ),
                              ),
                              color: AppTheme.color6,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 15,top: 5,bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text('全'),
                                  text('部'),
                                  text('挑'),
                                  text('战'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  text(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: AppTheme.color5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: buildNavigationBar(),
      child: Container(
        margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight - 6),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            SeperateLine(),
            buildUnLoginView(),
            buildTopView(),
            SeperateLine(),
            buildMiddleView(),
            SeperateLine(),
            buildBottomViewItem(),
          ],
        ),
      ),
    );
  }
}
//                child: GridView(
//                  scrollDirection: Axis.horizontal,
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    childAspectRatio: 0.5,
//                    crossAxisCount: 1 ,
//                    mainAxisSpacing: 5.0,
//                    crossAxisSpacing: 10,
//                  ),
//                  children: <Widget>[
//                    Container(
//                        width: MediaQuery.of(context).size.width - 150,
//                        color: Colors.green),
//                    Container(
//                        width: MediaQuery.of(context).size.width - 150,
//                        color: Colors.blue),
//                    Container(
//                        width: MediaQuery.of(context).size.width - 150,
//                        color: Colors.red),
//                  ],
//                )

//              ListView(
//                scrollDirection: Axis.horizontal,
//                children: <Widget>[
//                  Container(
//                      width: MediaQuery.of(context).size.width - 150,
//                      color: Colors.green),
//                  Container(
//                      width: MediaQuery.of(context).size.width - 150,
//                      color: Colors.blue),
//                  Container(
//                      width: MediaQuery.of(context).size.width - 150,
//                      color: Colors.red),
//                ],
//              ),
