import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:frontend/model/get_userposts_model.dart';
import 'package:frontend/model/getdiscoverposts_model.dart';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/posts/getpost_resp.dart';
import 'package:frontend/response/posts/getuserposts_resp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/shared/config.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HttpConnectPost {
  String baseurl = Config.apiURL;
  String mytoken = Config.token;
   
  static decodeToken () async{
  String yourToken = Config.token; 
   Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
 
  var userId=decodedToken["id"];


 SharedPreferences  prefs = await SharedPreferences.getInstance();
   prefs.setString('userId', userId); 
} 

  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(baseurl + "posts/"),
        headers: {'Authorization': mytoken});

        decodeToken();
          
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

  Future<List<GetUserPostsModel>> getUserPosts(String id) async {
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
      throw Exception('Failed to get the user post');
    }
  }

  static Future<List<GetUserPostsModel>> getPost(String id) async {
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

  Future<List<GetDiscoverPostsModel>> getDiscoverPosts() async {
    final response = await http.get(Uri.parse(Config.apiURL + "post_discover/"),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body) as Map;

        return res["posts"]; 
      } else {
        throw Exception('Failed to get the discover posts');
      }
    } catch (e) {
      throw Exception('Failed to get the discover posts');
    } 
  } 

  Future<String> uploadImage(String filepath, String userid) async {
    try {
      String route = 'posts/';
      String url = baseurl + route;
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll({
        'Authorization': Config.token,
      });

      var ss = filepath.split('/').last;
      request.files.add(
        http.MultipartFile(
          'file',
          File(filepath).readAsBytes().asStream(),
          File(filepath).lengthSync(),
          filename: ss,
        ),
      );

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return responseString;
      }
    } catch (err) {
      log('$err');
    }
    return 'something goes wrong';
  }

  Future<String> createPosts(String content, String userId) async {
    Map<String, dynamic> postMap = {
      'content': content, 
      'user': userId,
    };
    final response =
        await http.post(Uri.parse(baseurl + 'posts/'), body: postMap, headers: {
      'Authorization': Config.token,
    }); 
  
    if (response.statusCode == 200) {
      jsonDecode(response.body) as Map;

      return "true";
    } else {
      return "false"; 
    }

    
  }
  
  Future<String> updatePosts(String content, String userId) async {
    Map<String, dynamic> postMap = {
      'content': content, 
      'user': userId,
    };
    final response =
        await http.post(Uri.parse(baseurl + 'posts/'), body: postMap, headers: {
      'Authorization': Config.token,
    }); 
  
    if (response.statusCode == 200) {
      jsonDecode(response.body) as Map;

      return "true";
    } else {
      return "false"; 
    }

    
  }

  Future<String> likePost(String postId, String userId) async {
    final response = await http.patch(
        Uri.parse(Config.apiURL + "post/" + postId + "/like"),
        headers: {'Authorization': Config.token},
        body: {'likes': userId, "_id": postId});
    try {
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to like posts');
    }
  }

  Future<String> unLikePost(String postId, String userId) async {
    final response = await http.patch(
        Uri.parse(Config.apiURL + "post/" + postId + "/unlike"),
        headers: {'Authorization': Config.token},
        body: {'likes': userId, "_id": postId});
    try {
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to unlike the post');
    }
  }

  Future<String> deletePost(String postid, String userid) async {
    final response = await http.delete(
        Uri.parse(Config.apiURL + "post/" + postid),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
    jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      } 
    } catch (e) {
      throw Exception('Failed to delete posts');
    }
  }

  Future<String> savePost(String postid, String userid) async {
    Map<String, String?> savePost = {'saved': postid, "_id": userid};
    final response = await http.patch(
        Uri.parse(Config.apiURL + "savePost/" + postid),
        headers: {'Authorization': Config.token},
        body: savePost);
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to save posts');
    }
  }

  Future<String> unsavePost(String postid, String userid) async {
    Map<String, String?> savePost = {'saved': postid, "_id": userid};
    final response = await http.patch(
        Uri.parse(Config.apiURL + "savePost/" + postid),
        headers: {'Authorization': Config.token},
        body: savePost);
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return res["msg"];
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to unsave posts');
    }
  }

}
