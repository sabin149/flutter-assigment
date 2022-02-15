// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getuserposts_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetUserPosts _$ResponseGetUserPostsFromJson(
        Map<String, dynamic> json) =>
    ResponseGetUserPosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetUserPostsToJson(
        ResponseGetUserPosts instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
