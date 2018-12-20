import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  String avatar;

  String userName;

  String iconFlag;

  @JsonKey(nullable: true)
  int userType;

  int answerCount;

  int attentionCount;

  int isAttentioned;

  UserModel();

//   UserModel(this.userName,this.userType,this.answerCount,this.attentionCount,this.isAttentioned,{this.avatar,this.iconFlag});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
