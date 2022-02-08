import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/getpost_resp.dart';
import 'package:http/http.dart' as http;
import '/http/httpuser.dart';

class HttpConnectPost {
  String baseurl = "http://10.0.2.2:5000/api/";
  String mytoken = HttpConnectUser.token;

  Future<List<PostModel>> getPosts() async { 
    final response = await http.get(Uri.parse(baseurl + "posts/"),
        headers: {'Authorization': mytoken});
       if (response.statusCode == 200) {

    var userMap = ResponseGetPost.fromJson(jsonDecode(response.body));
  
    return userMap.posts;
    // } else {
    //   throw Exception('Failed to load post');
    // }
    // return data.map((e) => PostModel.fromJson(e)).toList();
//     List<PostModel> posts = userMap.posts;
// List<dynamic> data = userMap["posts"];

 
//  var map = jsonDecode(response.body); //-- json string convert bhayo
// List<dynamic> data = map["posts"];
// // print(data);
//       return map.data;
    } else {
      throw Exception('Failed to load post');
    } 
  }
}
