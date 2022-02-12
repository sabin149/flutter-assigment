import 'package:frontend/model/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getpost_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetPost{
  final String msg;
  final List<PostModel> posts;

  ResponseGetPost({
    required this.msg,
    required this.posts,
  });
  

  factory ResponseGetPost.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetPostFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetPostToJson(this);

}