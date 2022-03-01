import 'package:floor/floor.dart';

@entity
class PostEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? postId;
  final String? avatar;
  final String? username;
  final String? likeCount;
  final String? postContent;
  final String? commentCount;

  PostEntity({this.postId ,this.id, this.avatar, this.username, this.likeCount, this.postContent, this.commentCount});
}
 