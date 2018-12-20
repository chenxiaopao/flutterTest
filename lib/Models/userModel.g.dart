// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..avatar = json['avatar'] as String
    ..userName = json['userName'] as String
    ..iconFlag = json['iconFlag'] as String
    ..userType = json['userType'] as int
    ..answerCount = json['answerCount'] as int
    ..attentionCount = json['attentionCount'] as int
    ..isAttentioned = json['isAttentioned'] as int;
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'userName': instance.userName,
      'iconFlag': instance.iconFlag,
      'userType': instance.userType,
      'answerCount': instance.answerCount,
      'attentionCount': instance.attentionCount,
      'isAttentioned': instance.isAttentioned
    };
