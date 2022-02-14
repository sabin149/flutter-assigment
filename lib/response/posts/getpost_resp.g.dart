// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getpost_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetPost _$ResponseGetPostFromJson(Map<String, dynamic> json) =>
    ResponseGetPost(
      msg: json['msg'] as String,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetPostToJson(ResponseGetPost instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
