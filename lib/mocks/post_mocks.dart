import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/getdiscoverposts_model.dart';
import '../pages/shared/config.dart';

class PostApiProvider{

  final http.Client client;
  PostApiProvider({ required this.client});
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
  
  
  Future<String> deletePost(String postid, String userid) async {
    final response = await client.delete(
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

  
  }