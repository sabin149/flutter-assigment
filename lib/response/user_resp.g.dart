// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUser _$ResponseUserFromJson(Map<String, dynamic> json) => ResponseUser(
      user: (json['user'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool,
      accesstoken: json['accesstoken'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$ResponseUserToJson(ResponseUser instance) =>
    <String, dynamic>{
      'success': instance.success,
      'accesstoken': instance.accesstoken,
      'msg': instance.msg,
      'user': instance.user.map((e) => e.toJson()).toList(),
    };
