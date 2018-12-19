import 'package:flutter_zhihu_app/Blocs/bloc_provider.dart';
import 'dart:async';

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