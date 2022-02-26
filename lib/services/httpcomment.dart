import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:http/http.dart' as http;
import '../pages/shared/config.dart';

class HttpConnectComment{
  
    String baseurl = Config.apiURL;
  String mytoken = Config.token;
  
  Future<String> createComment(Comments comment) async {
    Map<String, dynamic> createComment = {
      'content': comment.content,
      'postId': comment.postId,
      "postUserId": comment.postUserId
    };

    final response = await http.post(
        Uri.parse(
          baseurl + "comment/",
        ),
        headers: {'Authorization': Config.token},
        body: createComment);

    if (response.statusCode == 200) {
      jsonDecode(response.body) as Map;
      // print(jsonData);
      return "true";
    } else {
      return "false";
    }
  }

  Future<String> updateComment(Comments comment, String id) async {
   Map<String, String?> updateComment = {'content': comment.content};

    final response = await http.put(
        Uri.parse(
          baseurl + "comment/" + id,
        ),
        headers: {'Authorization': Config.token},
        body: updateComment);

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as Map;

      return res["msg"];
    } else {
      var res = jsonDecode(response.body) as Map;

      return res["msg"];
    }
  }

  Future<String> deleteComment(String id) async {
    final response = await http.delete(
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

  Future<String> likeComment(String commentId, String userId) async {
    final response = await http.patch(
        Uri.parse(Config.apiURL + "comment/" + commentId + "like"),
        headers: {'Authorization': Config.token},
        body: {'likes': userId});
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

  Future<String> unLikeComment(String commentId, String userId) async {
    final response = await http.patch(
        Uri.parse(Config.apiURL + "comment/" + commentId + "unlike"),
        headers: {'Authorization': Config.token},
        body: {'likes': userId});
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