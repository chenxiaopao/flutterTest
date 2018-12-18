import 'package:flutter/material.dart';
import 'package:flutter_zhihu_app/Widgets/seperateLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/CircleImage.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/VideoPlayWidget.dart';

class AttentionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttentionPageState();
  }
}

class AttentionPageState extends State<AttentionPage> {



  buildTopView() {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 145,
                child: Stack(children: <Widget>[
                  Positioned(child: CircleImage(child: Icon(Icons.home))),
                  Positioned(
                      left: 35.0, child: CircleImage(child: Icon(Icons.phone))),
                  Positioned(
                      left: 70.0, child: CircleImage(child: Icon(Icons.map))),
                  Positioned(
                      left: 105.0, child: CircleImage(child: Icon(Icons.list))),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '发现更多感兴趣的人',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text('发现'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              SeperateLine(),
            ],
          ),
        ),
      ),
    );
  }

  buildListCell(index) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('assets/group_ic_wechat_nor.png',
                    height: 15, width: 15),
                SizedBox(width: 10),
                Text(
                  '陈小炮赞同了该文章•3天前',
                  style: TextStyle(color: AppTheme.color6),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '陈小炮是真的帅陈小炮是真的帅陈小炮是真的帅陈小炮是真的帅陈小炮是真的帅',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Offstage(offstage: index==3||index==7,child: VideoPlayWidget()),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内'
                        '容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细'
                        '内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Offstage(
                  offstage: index%2 == 0,
                  child: Container(
                    color: Colors.yellow,
                    width: 80,
                    height: 60,
                    margin: EdgeInsets.only(left: 10),
                    child: Image.asset('assets/ic_nothing_01.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '267赞同 • 77评论',
                    style: TextStyle(color: AppTheme.color6),
                    textAlign: TextAlign.left,
                  ),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SeperateLine(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildTopView();
          }
          index -= 1;
          return buildListCell(index);
        },
      ),
    );
  }
}
