import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TestPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState();
  }
}

class TestPageState extends State<TestPage>{


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