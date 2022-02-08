// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['_id'] as String?,
      content: json['content'] as String?,
      likes: json['likes'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] as String?,
    )..images = json['images'] as List<dynamic>?;

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      '_id': instance.id,
      'images': instance.images,
      'content': instance.content,
      'likes': instance.likes,
      'comments': instance.comments,
      'user': instance.user,
      'createdAt': instance.createdAt,
    };
