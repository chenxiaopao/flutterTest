import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CollegePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollegePageState();
  }
}

class CollegePageState extends State<CollegePage>{


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: new Container(color: Colors.yellow,),
      navigationBar: CupertinoNavigationBar(
        middle: new Text('Home'),
      ),
    );
  }
}