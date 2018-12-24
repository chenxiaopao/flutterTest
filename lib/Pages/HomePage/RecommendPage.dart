import 'package:flutter/material.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecommendPageState();
  }
}

class RecommendPageState extends State<RecommendPage> {
  ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return buildTopAdListCell();
        }
        index -= 1;
        return Center(
          child: InkWell(
            child: SizedBox(height: 100, child: Text('11111')),
            onTap: () {},
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    
    super.initState();
  }
}
