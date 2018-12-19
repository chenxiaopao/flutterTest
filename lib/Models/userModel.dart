import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {

   final String avatar;

   final String userName;

   final String iconFlag;

   final int userType;

   final int answerCount;

   final int attentionCount;

   final int isAttentioned;

   UserModel(this.userName,this.userType,this.answerCount,this.attentionCount,this.isAttentioned,{this.avatar,this.iconFlag});

   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
   Map<String, dynamic> toJson() => _$UserModelToJson(this);

}