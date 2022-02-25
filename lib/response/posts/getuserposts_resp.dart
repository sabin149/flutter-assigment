
import 'package:frontend/model/get_userposts_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getuserposts_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetUserPosts{
  final List<GetUserPostsModel> posts;

  ResponseGetUserPosts({
    required this.posts,
  });
  
  factory ResponseGetUserPosts.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetUserPostsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetUserPostsToJson(this);
}


