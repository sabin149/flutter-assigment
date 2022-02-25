
import 'package:frontend/model/getdiscoverposts_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getdiscoverposts_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetDiscoverPosts{
  final List<GetDiscoverPostsModel> posts;

  ResponseGetDiscoverPosts({
    required this.posts,
  });
  
  factory ResponseGetDiscoverPosts.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetDiscoverPostsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetDiscoverPostsToJson(this);
}


