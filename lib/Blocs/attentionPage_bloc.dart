import 'package:flutter_zhihu_app/Blocs/bloc_provider.dart';
import 'dart:async';
import 'package:flutter_zhihu_app/Widgets/dialogs.dart';
import 'package:flutter/material.dart';
class AttentionPageBloc extends BlocBase{

  final goRecommendController = StreamController<int>.broadcast();

  Stream<int> get goRecStream => goRecommendController.stream;

  AttentionPageBloc();

  void jumpToRecommendPage(){
    goRecommendController.sink.add(1);
  }




  @override
  void dispose() {
    goRecommendController.close();
    super.dispose();
  }
}

final attentionPageBloc = AttentionPageBloc();