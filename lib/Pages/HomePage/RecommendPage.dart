import 'package:flutter/material.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';
import 'package:english_words/english_words.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecommendPageState();
  }
}

class RecommendPageState extends State<RecommendPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  double progress = 0;
  List list = List();
  bool isShowIndicatorValue = true;
  bool isShowReminderInfo = false;
  AnimationController _animationController;
  Animation<double> _animation;
  double margin = 30;
  bool isLoding = false;
  double scale = 1;

  //顶部广告cell
  buildTopAdListCell() {
    return GestureDetector(
      onTap: () {
        print(2);
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        color: AppTheme.color6,
//      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/group_bg_invite_nor.png',
              height: 150,
              width: MediaQuery.of(context).size.width - 40,
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                  color: AppTheme.color3,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 5),
                        Text('广告', style: TextStyle(color: AppTheme.color1)),
                        Icon(Icons.keyboard_arrow_down, color: AppTheme.color1),
                      ],
                    ),
                    onTap: () {
                      print(1);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  //无图和右图cell
  buildNoImageAndRightImageCell() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            '',
            style: TextStyle(),
          )
        ],
      ),
    );
  }

  //其他广告cell（包含图片）
  buildHasRightImageCell() {}

  //有视频cell
  buildHasVideoCell() {}

  //有数据界面
  buildHasDataView() {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 30,
          height: 30,
          top: 10,
          left: MediaQuery.of(context).size.width / 2 - 15,
          child: isShowIndicatorValue
              ? CircularProgressIndicator(
                  strokeWidth: 7,
                  value: progress,
                  valueColor: AlwaysStoppedAnimation(AppTheme.color6),
                )
              : Transform.scale(
                  scale: scale,
                  child: CircularProgressIndicator(
                    strokeWidth: 7,
                    valueColor: AlwaysStoppedAnimation(AppTheme.color6),
                  ),
                ),
        ),
        Listener(
          onPointerUp: (event) {
            if (progress == 1) {
              isShowIndicatorValue = false;
              Future.delayed(Duration(seconds: 3), () {
                if (mounted) {
                  setState(() {
                    list = generateWordPairs().take(9).toList();
                    isShowIndicatorValue = true;
                    _animationController.forward();
                    isShowReminderInfo = true;
                    progress = 0;
                  });
                }
              });
            } else {
              progress = 0;
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: isShowIndicatorValue ? 0 : 50),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: list.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildTopAdListCell();
                }
                index -= 1;
                return index == list.length
                    ? Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          child: SizedBox(
                              height: 100, child: Text('${list[index]}')),
                          onTap: () {},
                        ),
                      );
              },
            ),
          ),
        ),
        Offstage(
          offstage: !isShowReminderInfo,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: _animation.value,
            color: AppTheme.color9,
            child: Center(
              child: Text(
                _animation.value > 15 ? '获取到9条数据' : '',
                style: TextStyle(color: AppTheme.color1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //无数据刷新界面
  buildNoDataRefreshView() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 30,
          height: 30,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 7.0,
              valueColor: AlwaysStoppedAnimation(AppTheme.color6),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return list.length == 0 ? buildNoDataRefreshView() : buildHasDataView();
  }

  @override
  void initState() {
    super.initState();

    if (mounted) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          list = generateWordPairs().take(9).toList();
        });
      });

      _animationController = AnimationController(
          duration: Duration(milliseconds: 300), vsync: this);
      _animation =
          Tween<double>(begin: 0, end: 30.0).animate(_animationController)
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Future.delayed(Duration(seconds: 1), () {
                  _animationController.reverse();
                });
              }
            });

      _scrollController.addListener(() {
        if (_scrollController.offset < -margin) {
          setState(() {
            _scrollController.offset + margin > -80
                ? progress = (_scrollController.offset + margin) / -80.0
                : progress = 1;
//            if (progress  == 1){
//              setState(() {
//                scale = 1.2;
//              });
//              Future.delayed(Duration(milliseconds: 500), () {
//                setState(() {
//                  scale = 1.0;
//                });
//              });
//            }
          });


        }

        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          if (!isLoding) {
            setState(() {
              isLoding = true;
            });

            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                list += generateWordPairs().take(10).map((wordPair) {
                  return WordPair('新的数据', wordPair.toString());
                }).toList();
                isLoding = false;
              });
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
