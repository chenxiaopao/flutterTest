import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IdeaPageState();
  }
}

class IdeaPageState extends State<IdeaPage> {
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
