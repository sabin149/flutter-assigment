// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getuser_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetUser _$ResponseGetUserFromJson(Map<String, dynamic> json) =>
    ResponseGetUser(
      user: (json['user'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetUserToJson(ResponseGetUser instance) =>
    <String, dynamic>{
      'user': instance.user.map((e) => e.toJson()).toList(),
    };
