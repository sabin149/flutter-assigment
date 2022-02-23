import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:frontend/response/user/getuser_resp.dart';
import 'package:http/http.dart';
import '../model/register_model.dart';
import '../response/user/user_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpConnectUser {
  String baseurl = Config.apiURL;
  static String authtoken = '';

  SharedPreferences? prefs;

  Future<bool> registerPost(User user) async {
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
      return false;
    }
  }

  Future<bool> loginPosts(String email, String password) async {
    Map<String, dynamic> loginStudent = {'email': email, 'password': password};
    try {
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
         
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
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
        // return res.user;
      } else { 
        throw Exception('Failed to get the user'); 
      } 
    } catch (e) { 
      print(e);
      throw Exception('Failed to get the user details');
    }
  }
}
