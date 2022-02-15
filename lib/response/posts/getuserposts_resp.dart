
import 'package:json_annotation/json_annotation.dart';

import '../../model/post_model.dart';

part 'getuserposts_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetUserPosts{
  final List<PostModel> posts;

  ResponseGetUserPosts({
    required this.posts,
  });
  
  factory ResponseGetUserPosts.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetUserPostsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetUserPostsToJson(this);
}


