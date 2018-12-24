
import 'package:flutter_zhihu_app/Models/userModel.dart';
import 'package:english_words/english_words.dart';
class ZhihuApi {

  //生成推荐用户
  Future<List<UserModel>> getUserData() async{
    List<UserModel> list = List();
    await Future.delayed(Duration(seconds: 2),(){
      for (int i = 0; i < 8; i++) {
        list.add(this.getOneUserData());
      }
    });
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

}

final zhihu = ZhihuApi();