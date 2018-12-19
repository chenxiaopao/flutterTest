// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
      json['userName'] as String,
      json['userType'] as int,
      json['answerCount'] as int,
      json['attentionCount'] as int,
      json['isAttentioned'] as int,
      avatar: json['avatar'] as String,
      iconFlag: json['iconFlag'] as String);
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
