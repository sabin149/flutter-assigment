import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';
import '../pages/shared/config.dart';

class CommentApiProvider{
  final http.Client client;
  CommentApiProvider({ required this.client});

  String baseurl = Config.apiURL;
  String mytoken = Config.token;

  Future<String> createComment(Comments comment) async {
    Map<String, dynamic> createComment = {
      'content': comment.content,
      'postId': comment.postId,
      "postUserId": comment.postUserId
    };

    final response = await client.post(
        Uri.parse(
          baseurl + "comment",
        ),
        headers: {'Authorization': Config.token},
        body: createComment);

    if (response.statusCode == 200) {
      jsonDecode(response.body) as Map;
      return "true";
    } else {
      return "false";
    }
  }

  Future<String> deleteComment(String id) async {
    final response = await client.delete(
        Uri.parse(Config.apiURL + "comment/" + id),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return res["msg"];
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to get the discover posts');
    }
  }
}