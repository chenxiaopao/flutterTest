import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double width;
  final double height;
  Widget child;
  final borderWidth = 3.0;
  CircleImage({this.width = 40, this.height = 40,  @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + borderWidth,
      height: height + borderWidth,

      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
      padding: EdgeInsets.all(borderWidth),
      child: CircleAvatar(child: child,),
    );
  }
}
