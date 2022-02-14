import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/posts/getpost_resp.dart';
import 'package:http/http.dart' as http;
import '../pages/shared/config.dart';
import 'httpuser.dart';

class HttpConnectPost {
  String baseurl = Config.apiURL;
  String mytoken = HttpConnectUser.token;

  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(baseurl + "posts/"),
        headers: {'Authorization': mytoken});
    try {
      if (response.statusCode == 200) {
      var res = ResponseGetPost.fromJson(jsonDecode(response.body));
      return res.posts;
    } else {
      throw Exception('Failed to get the post');
    }
    } catch (e) {
      throw Exception('Failed to get the post');
    }
  }

  
}
