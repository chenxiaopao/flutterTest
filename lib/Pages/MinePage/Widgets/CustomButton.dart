import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Image image;

  CustomButton({@required this.text, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          image,
          Text(text,style: TextStyle(fontSize: 14),),
        ],
      ),
    );
  }
}
