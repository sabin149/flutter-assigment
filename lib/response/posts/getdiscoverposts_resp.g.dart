// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getdiscoverposts_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetDiscoverPosts _$ResponseGetDiscoverPostsFromJson(
        Map<String, dynamic> json) =>
    ResponseGetDiscoverPosts(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => GetDiscoverPostsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetDiscoverPostsToJson(
        ResponseGetDiscoverPosts instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
