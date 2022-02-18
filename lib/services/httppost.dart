import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/posts/getpost_resp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/shared/config.dart';

class HttpConnectPost {
  String baseurl = Config.apiURL;
  String mytoken = Config.token;

  static String post="";

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

  Future<List<PostModel>> getUserPosts(String id) async {
    final response = await http.get(Uri.parse(baseurl + "user_posts/" + id),
        headers: {'Authorization': mytoken});

    try {
      if (response.statusCode == 200) {
        var res = ResponseGetPost.fromJson(jsonDecode(response.body));
        SharedPreferences prefs=await SharedPreferences.getInstance();
      
          prefs.setString('post', post);
        return res.posts;
      } else {
        throw Exception('Failed to get the user posts');
      }
    } catch (e) {
      throw Exception('Failed to get the user posts');
    }
  }

  static Future<bool> createPost( 
    PostModel model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var postURL = Config.apiURL;

    if (isEditMode) {
      postURL = postURL  + model.sId.toString();
    }

    var url = Uri.http(Config.apiURL, "posts/");
    var requestMethod = isEditMode ? "PUT" : "POST";

    var request = http.MultipartRequest(requestMethod, url);
     request.headers.addAll({
        'Authorization': Config.token,
      });
    request.fields["content"] = model.content!;
    request.fields["images"] = model.images as String;

    if (model.images != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'images',
        model.images as String,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send(
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}


