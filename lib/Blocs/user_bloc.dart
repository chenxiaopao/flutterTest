import 'package:flutter_zhihu_app/Blocs/bloc_provider.dart';
import 'dart:async';
import 'package:english_words/english_words.dart';
import 'package:flutter_zhihu_app/Models/userModel.dart';

class UserBloc extends BlocBase {
  final attentionController = StreamController<int>.broadcast();

  Stream<int> get attentionStream => attentionController.stream;

  final changeUserController = StreamController<List>.broadcast();

  Stream<List> get changeUserStream => changeUserController.stream;

  UserBloc();

  //关注按钮
  void singleAttentionAction(userList, index) {
    userList[index].isAttentioned = 1;
    attentionController.sink.add(-1);
    Future.delayed(Duration(seconds: 2), () {
      attentionController.sink.add(1);
      Future.delayed(Duration(milliseconds: 500), () {
        (userList as List).removeAt(index);
        (userList as List).add(this.getOneUserData());
        changeUserController.sink.add(userList);
      });
    });
  }

  void allAttentionAction(List<UserModel> userList) {
    userList.forEach((userModel) {
      userModel.isAttentioned = 1;
    });
    attentionController.sink.add(-1);
    Future.delayed(
      Duration(seconds: 2),
      () {
        attentionController.sink.add(1);
        Future.delayed(Duration(milliseconds: 500), () {
          this.changeOthers();
        });
      },
    );
  }

  //生成推荐用户
  List<UserModel> getUserData() {
    List<UserModel> list = List();
    for (int i = 0; i < 8; i++) {
      list.add(this.getOneUserData());
    }
    return list;
  }

  UserModel getOneUserData() {
    Map<String, dynamic> map = Map();
    generateWordPairs().take(1).forEach((wordPair) {
      map['avatar'] = 'assets/me_ic_headportrait_square_def.png';
      map['answerCount'] = 100;
      map['attentionCount'] = 1000;
      map['iconFlag'] = 'assets/ic_star_top.png';
      map['isAttentioned'] = 0;
      map['userName'] = wordPair.toString();
    });
    return UserModel.fromJson(map);
  }

  //换一批
  void changeOthers() {
    List list = this.getUserData();
    changeUserController.sink.add(list);
  }

  @override
  void dispose() {
    attentionController.close();
    changeUserController.close();
    super.dispose();
  }
}
