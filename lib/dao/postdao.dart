import '../entity/post_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostDao{

//find by id
  @Query('SELECT * FROM PostEntity WHERE postId = :postId')
  Future<PostEntity?> findPostById(String postId);

// insert
  @insert
  Future<int> insertPost(PostEntity post);

  //find all posts
  @Query('SELECT * FROM PostEntity')
  Future<List<PostEntity>> findAllPosts();

  //delete posts
  @Query('DELETE FROM PostEntity WHERE postId = :postId')
  Future<List<PostEntity>> deletePosts(String postId);

  //update posts
  @update
  Future<int> updatePost(PostEntity post);

}