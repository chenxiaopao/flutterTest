import 'package:flutter_zhihu_app/Blocs/bloc_provider.dart';
import 'dart:async';
import 'package:flutter_zhihu_app/NetWorking/zhihuApi.dart';
import 'package:flutter_zhihu_app/Models/userModel.dart';

class UserBloc extends BlocBase {
  final attentionController = StreamController<int>.broadcast();

  Stream<int> get attentionStream => attentionController.stream;

  final changeUserController = StreamController<List>.broadcast();

  Stream<List> get changeUserStream => changeUserController.stream;

  UserBloc();

  var userList = List<UserModel>();

  //关注按钮
  void singleAttentionAction(userList, index) {
    userList[index].isAttentioned = 1;
    attentionController.sink.add(-1);
    Future.delayed(Duration(seconds: 2), () {
      attentionController.sink.add(1);
      Future.delayed(Duration(milliseconds: 500), () {
        (userList as List).removeAt(index);
        (userList as List).add(zhihu.getOneUserData());
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
          this.getUserList();
        });
      },
    );
  }

  Future<void> getUserList() async{
     userList =  await zhihu.getUserData();
     changeUserController.sink.add(userList);
  }


  @override
  void dispose() {
    attentionController.close();
    changeUserController.close();
    super.dispose();
  }
}
