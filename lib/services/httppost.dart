import 'dart:convert';
import 'package:frontend/model/get_userposts_model.dart';
import 'package:frontend/model/getdiscoverposts_model.dart';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/posts/getdiscoverposts_resp.dart';
import 'package:frontend/response/posts/getpost_resp.dart';
import 'package:frontend/response/posts/getuserposts_resp.dart';
import 'package:http/http.dart' as http;
import '../pages/shared/config.dart';

class HttpConnectPost {
  String baseurl = Config.apiURL;
  String mytoken = Config.token;

  static String post = "";

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

  static Future<List<GetUserPostsModel>> getUserPosts(String id) async {
    final response = await http.get(
        Uri.parse(Config.apiURL + "user_posts/" + id),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
        var res = ResponseGetUserPosts.fromJson(jsonDecode(response.body));

        return res.posts;
      } else {
        throw Exception('Failed to get the user posts');
      }
    } catch (e) {
      throw Exception('Failed to get the user postsss');
    }
  }

  static Future<List<GetDiscoverPostsModel>> getDiscoverPosts() async {
    final response = await http.get(Uri.parse(Config.apiURL + "post_discover/"),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
        var res = ResponseGetDiscoverPosts.fromJson(jsonDecode(response.body));
       

        return res.posts;
      } else {
        throw Exception('Failed to get the discover posts');
      }
    } catch (e) {
      throw Exception('Failed to get the discover posts');
    }
  }

  static Future<bool> createPost(
    String imageUrl,
    PostModel model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var postURL = Config.apiURL;

    if (isEditMode) {
      postURL = postURL + model.sId.toString();
    }

    var url = Uri.http(Config.apiURL, "posts/");
    var requestMethod = isEditMode ? "PUT" : "POST";

    var request = http.MultipartRequest(requestMethod, url);
    request.headers.addAll({
      'Authorization': Config.token,
    });

    request.fields["content"] = model.content!;
    request.fields["images"] = model.images! as String;

    //list of images

    // request.fields["images"] = model.images as String;
    // List<Network> request.fields["images"] = List<NetworkImage>();

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
