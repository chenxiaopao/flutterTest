import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessagePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage>{


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