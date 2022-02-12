import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart';
import '/response/user_resp.dart'; 


class HttpConnectUser {
  String baseurl = Config.apiURL;
  static String token = '';


  Future<bool> registerPost(UserModel user) async {
    Map<String, dynamic> userMap = {
      "fullname": user.fullname,
      "email": user.email,
      "username": user.username,
      "password": user.password,
    };

    final response = await post(Uri.parse(baseurl + 'register'), body: userMap);
    if (response.statusCode == 200) {
      var usrRes = ResponseUser.fromJson(jsonDecode(response.body));
      return usrRes.success;
    } else {
      return false;
    }
  }

  Future<bool> loginPosts(String email, String password) async {
    Map<String, dynamic> loginStudent = {'email': email, 'password': password};
    try {
      final response = await post(
          Uri.parse(
            baseurl + "login",
          ),
          body: loginStudent);
      final jsonData = jsonDecode(response.body) as Map;
      token = jsonData['access_token'];
    //  print(token);
      if (token.isNotEmpty) {
        return true;
      }  
    } catch (e) {
      if (kDebugMode) {
        print(e); 
      }
    } 
    return false;
  }
 
  Future<bool> logout() async {
    try {
      final response = await post(
          Uri.parse(
            baseurl + "logout", 
          ));
      final jsonData = jsonDecode(response.body) as Map;
 
      // final jsonData = jsonDecode(response.body) as Map;
    
      if (jsonData['success']) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }


}




