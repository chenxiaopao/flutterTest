import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MinePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MinePageState();
  }
}

class MinePageState extends State<MinePage>{


  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      child: new Text('idea'),
      navigationBar: CupertinoNavigationBar(
        middle: new Text('idea'),
      ),
    );
  }
}