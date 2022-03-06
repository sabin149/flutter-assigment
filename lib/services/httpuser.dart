import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:frontend/model/updateuser_model.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart';
import '../model/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpConnectUser {
  String baseurl = Config.apiURL;
  static String authtoken = '';
  static String userid = '';
  SharedPreferences? prefs;

  Future<String> registerUser(User user) async {
    Map<String, dynamic> userMap = {
      "fullname": user.fullname,
      "email": user.email,
      "username": user.username,
      "password": user.password,
    };

    final response = await post(Uri.parse(baseurl + 'register'), body: userMap);
    if (response.statusCode == 200) {
      var usrRes = jsonDecode(response.body) as Map;
      return usrRes['msg'];
    } else {
      var usrRes = jsonDecode(response.body) as Map;
      return usrRes['msg'];
    }
  }

    Future<String> loginUsers(String email, String password) async {
    Map<String, dynamic> loginStudent = {'email': email, 'password': password};

    prefs = await SharedPreferences.getInstance();
    final response = await post(
        Uri.parse(
          baseurl + "login",
        ),
        body: loginStudent);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;
      authtoken = jsonData['access_token'];
      prefs!.setString('token', authtoken);
   
      Config.loadToken();
      return "true";
    } else {
      var userResponse = jsonDecode(response.body);
      return userResponse['msg'];
    }
  }

  static Future<bool> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  Future<UserModel> getUserDetails(String id) async {
    final response = await get(Uri.parse(Config.apiURL + "user/" + id),
        headers: {'Authorization': Config.token});

    try { 
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);

        var user = UserModel.fromJson(map);
  
        return user;
      } else {
        throw Exception('Failed to get the user');
      }
    } catch (e) {
      throw Exception('Failed to get the user details');
    }
  }


 Future<List<UserModel>> searchUser(String username) async {
    final response = await get(
        Uri.parse(Config.apiURL + "search?username=" + username),
        headers: {'Authorization': Config.token});
    try {
   
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);

        return res["users"];
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      } 
    } catch (e) {
      throw Exception('Failed to get the users');
    }
  }
 
 Future<String> suggestionsUser(String userId) async {
    final response = await get(
        Uri.parse(Config.apiURL + "search/" + userId),
        headers: {'Authorization': Config.token});
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      } 
    } catch (e) {
      throw Exception('Failed to get the users');
    }
  }

Future<String> followUser(String loginUserId, String otherUserId) async { 
    final response = await patch(
        Uri.parse(Config.apiURL + "user/" + otherUserId + "/follow"),
        headers: {'Authorization': Config.token},
        body: {'following': otherUserId, "_id": loginUserId});
    try {
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to follow the posts');
    }
  }
Future<String> unFollowUser(String loginUserId, String otherUserId) async { 
    final response = await patch(
        Uri.parse(Config.apiURL + "user/" + otherUserId + "/follow"),
        headers: {'Authorization': Config.token},
        body: {'following': otherUserId, "_id": loginUserId});
    try {
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to unfollow the user');
    }
  }

Future<String> updateUser(UpdateUserModel user) async {
    Map<String, dynamic> userMap = {
      "_id":user.sId,
      "fullname": user.fullname,
      "email": user.email,
      "username": user.username,
      "mobile": user.mobile,
      "story": user.story,
      "avatar": user.avatar
      }; 


    final response = await patch(
        Uri.parse(Config.apiURL + "user/"),
        headers: {'Authorization': Config.token},
        body: userMap);
  
    try {
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        return "true";
      } else {
        var res = jsonDecode(response.body);
        return res["msg"];
      }
    } catch (e) {
      throw Exception('Failed to unfollow the user');
    }
  }




}
