import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/register_model.dart';
import '../model/user_model.dart';
import '../pages/shared/config.dart';

class UserApiProvider{
  SharedPreferences? prefs;
  final http.Client client;
  static String authtoken = '';
  UserApiProvider({ required this.client});

Future<UserModel> getUserDetails(String id) async {
    final response = await client.get(Uri.parse(Config.apiURL + "user/" + id),
        headers: {'Authorization': Config.token});

      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
       
        var user = UserModel.fromJson(map);
        return user;
      } else {
        throw Exception('Failed to get the user');
      }
  
  }
  
Future<String> loginUsers(String email, String password) async {
    Map<String, dynamic> loginUser = {'email': email, 'password': password};

    prefs = await SharedPreferences.getInstance();
    final response = await client.post(
        Uri.parse(
          Config.apiURL + "login",
        ),
        body: loginUser);
    if (response.statusCode == 200) {
     jsonDecode(response.body) as Map;
      return "true";
    } else {
      var userResponse = jsonDecode(response.body);
      return userResponse['msg'];
    }
  }

Future<String> registerUser(User user) async {
    Map<String, dynamic> userMap = {
      "fullname": user.fullname,
      "email": user.email,
      "username": user.username,
      "password": user.password,
    };

    final response = await client.post(Uri.parse(Config.apiURL + 'register'), body: userMap);
    if (response.statusCode == 200) {
      var usrRes = jsonDecode(response.body) as Map;
      return usrRes['msg'];
    } else {
      var usrRes = jsonDecode(response.body) as Map;
      return usrRes['msg'];
    }
  }

}