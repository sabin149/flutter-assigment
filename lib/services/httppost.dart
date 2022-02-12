import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/getpost_resp.dart';
import 'package:http/http.dart' as http;
import '../pages/shared/config.dart';
import 'httpuser.dart';


class HttpConnectPost {
 String baseurl = Config.apiURL;
  String mytoken = HttpConnectUser.token;

 
  Future<List<PostModel>> getPosts() async {  
    final response = await http.get(Uri.parse(baseurl + "posts/"),
        headers: {'Authorization': mytoken});
    if (response.statusCode == 200) {
   var a = ResponseGetPost.fromJson(jsonDecode(response.body));
      return a.posts; 
    } else { 
      throw Exception('Failed to load post');
    }
  }
}
 
 