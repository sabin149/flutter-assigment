import 'dart:convert';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/response/getpost_resp.dart';
import 'package:http/http.dart' as http;
import '/http/httpuser.dart';

class HttpConnectPost {
  String baseurl = "http://10.0.2.2:5000/api/";
  // String mytoken = HttpConnectUser.token;
  String mytoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYjc3YTlmYzI5MTFjYTQ5NGJlOTkxYyIsImlhdCI6MTY0NDgyMTYzNywiZXhwIjoxNjQ0OTA4MDM3fQ.-iGFPTvv4slkjnCplfscd0fRMhRVLnSHGuCa7u8gZb0";
 
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
 
 