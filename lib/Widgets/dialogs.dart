import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showInfo(Widget child,AnimationController animationController,context){


  CurvedAnimation animation = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
  showDialog(context: context,builder: (context){
    return SizeTransition(sizeFactor: animation,child: child,);
  });



}