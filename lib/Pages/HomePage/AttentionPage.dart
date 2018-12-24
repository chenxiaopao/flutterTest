import 'package:flutter/material.dart';
import 'package:flutter_zhihu_app/Widgets/seperateLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/CircleImage.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/VideoPlayWidget.dart';
import 'package:flutter_zhihu_app/Blocs/attentionPage_bloc.dart';
import 'package:flutter_zhihu_app/Blocs/user_bloc.dart';
import 'package:flutter_zhihu_app/Models/userModel.dart';
import 'package:flutter_zhihu_app/Pages/HomePage/Widgets/UnInterestedButton.dart';
import 'dart:async';
import 'package:flutter_zhihu_app/Widgets/dialogs.dart';

class AttentionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttentionPageState();
  }
}

class AttentionPageState extends State<AttentionPage>
    with SingleTickerProviderStateMixin {
  int _attentionCount = 0;
  final userBloc = UserBloc();
  List<UserModel> userList;

  /*创建叠加的头像*/
  buildImageStack(width) {
    double overlayWidth = 10;
    return SizedBox(
      width: (width + 5) * 4 - overlayWidth * 3,
      child: Stack(children: <Widget>[
        Positioned(
            child: CircleImage(
                child: Icon(Icons.home), width: width, height: width)),
        Positioned(
            left: width - 5,
            child: CircleImage(
                child: Icon(Icons.phone), width: width, height: width)),
        Positioned(
            left: (width - 5) * 2,
            child: CircleImage(
                child: Icon(Icons.map), width: width, height: width)),
        Positioned(
            left: (width - 5) * 3,
            child: CircleImage(
                child: Icon(Icons.list), width: width, height: width)),
      ]),
    );
  }

  buildTopViewNoAttention() {
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
              buildImageStack(40.0),
              SizedBox(
                height: 10,
              ),
              Text(
                '想在知乎上认识志趣相投的朋友吗？',
                style: AppTheme.textStyleFont16Weight700,
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

  buildListCellNoAttention(index) {
    UserModel userModel = userList[index];
    Widget w = Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  child: Image.asset(userModel.avatar),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          userModel.userName,
                          textAlign: TextAlign.left,
                          style: AppTheme.textStyleFont16Weight700,
                        ),
                        Icon(Icons.stars)
                      ],
                    ),
                    Text('「手机摄影」话题的活跃用户'),
                    Text(
                        '${userModel.answerCount}回答•${userModel.attentionCount}关注'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              StreamBuilder(
                initialData: 1,
                stream: userBloc.attentionStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return FlatButton.icon(
                    onPressed: () {
                      userBloc.singleAttentionAction(userList, index);
                      Future.delayed(Duration(seconds: 2), () {
                        _attentionCount = 1;
                        setState(() {});
                      });
                    },
                    color: AppTheme.color7,
                    icon: userModel.isAttentioned == 1 && snapshot.data == -1
                        ? CupertinoActivityIndicator()
                        : Offstage(
                            offstage: userModel.isAttentioned == 1,
                            child: Icon(
                              Icons.add,
                              color: AppTheme.color9,
                            ),
                          ),
                    label: Offstage(
                      offstage:
                          snapshot.data == -1 && userModel.isAttentioned == 1,
                      child: Text(userModel.isAttentioned == 1 ? '已关注' : '关注'),
                    ),
                    textColor: AppTheme.color9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  );
                },
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        w,
        Divider(
          indent: 70,
          height: 1,
        ),
      ],
    );
  }

  buildTopViewHasAttention() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          height: 40,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                '发现更多感兴趣的人',
                textAlign: TextAlign.left,
                style: AppTheme.textStyleFont16Weight700,
              )),
              buildImageStack(30.0),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
        SeperateLine(),
      ],
    );
  }

  buildListCellHasAttention(index) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Column(
        children: <Widget>[
          Container(
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
                  style: AppTheme.textStyleFont16Weight700,
                ),
                SizedBox(height: 10),
                Offstage(
                    offstage: index == 3 || index == 7,
                    child: VideoPlayWidget()),
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
                      offstage: index % 2 == 0,
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
              ],
            ),
          ),
          SeperateLine(height: 5.0)
        ],
      ),
    );
  }

  buildBottomViewNoAttention(index) {
    Widget sectionHeader;
    Widget bottomView;
    if (index == 0) {
      sectionHeader = Container(
        height: 30,
        margin: EdgeInsets.only(left: 10.0, top: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '你可能感兴趣的人',
                style: AppTheme.textStyleFont18Weight700,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                showUninterestedAlert(
                  UnInterestedButton(() {
                    print(1);
                  }),
                  context,
                );
              },
            ),
          ],
        ),
      );
    }

    Widget listCell = buildListCellNoAttention(index);

    if (index == userList.length - 1) {
      bottomView = Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 100,
                  child: FlatButton(
                    onPressed: () {
                      userBloc.getUserList();
                    },
                    child: Text('换一批',
                        style: TextStyle(fontSize: 16, color: AppTheme.color9)),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppTheme.color9),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: FlatButton(
                    color: AppTheme.color9,
                    textColor: AppTheme.color1,
                    onPressed: () {
                      userBloc.allAttentionAction(userList);
                      Future.delayed(Duration(seconds: 2), () {
                        _attentionCount = 1;
                        setState(() {});
                      });
                    },
                    child: Text(
                      '全部关注',
                      style: TextStyle(fontSize: 16),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppTheme.color7,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: <Widget>[
                Text(
                  '没有更多了，去推荐看看',
                  style: TextStyle(fontSize: 16, color: AppTheme.color5),
                ),
                FlatButton(
                    onPressed: () {
                      attentionPageBloc.jumpToRecommendPage();
                    },
                    child: Text('前往推荐',
                        style:
                            TextStyle(fontSize: 16, color: AppTheme.color9))),
              ],
            ),
          ),
        ],
      );
    }

    return index == 0
        ? Column(
            children: <Widget>[
              sectionHeader,
              listCell,
            ],
          )
        : index == userList.length - 1
            ? Column(
                children: <Widget>[
                  listCell,
                  bottomView,
                ],
              )
            : listCell;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight - 6),
      child: StreamBuilder(
        stream: userBloc.changeUserStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          userList = snapshot.hasData ? snapshot.data : null;
          return userList != null
              ? RefreshIndicator(
                  child: ListView.builder(
                    itemCount: userList != null ? userList.length + 1 : 0,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _attentionCount == 0
                            ? buildTopViewNoAttention()
                            : buildTopViewHasAttention();
                      }
                      index -= 1;
                      return _attentionCount == 0
                          ? buildBottomViewNoAttention(index)
                          : buildListCellHasAttention(index);
                    },
                  ),
                  onRefresh: userBloc.getUserList,
                )
              : Column(
                  children: <Widget>[
                    Container(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                      margin: EdgeInsets.only(top: 10),
                    ),
                    Expanded(child: SizedBox())
                  ],
                );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    userBloc.getUserList();
  }
}
