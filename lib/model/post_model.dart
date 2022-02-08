import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
   @JsonKey(name: "_id")
  late String? id;
  late List? images;
  late String? content;
  late List? likes ;
  late List? comments; 
  late String? user;
  String? createdAt;


  PostModel({
    this.id,
    this.content,
    this.likes,
    this.comments,
    this.user,
    this.createdAt,
  });


  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
 