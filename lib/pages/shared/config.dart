import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static String appName = "Let's Connect";
  static String apiURL = "http://10.0.2.2:5000/api/";

  static String token = "";
  static String post = "";
  

  static Future<String?> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = (prefs.getString('token') ?? '');
    return token;

  } 

  static Future<String?> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    post = (prefs.getString('post') ?? '');
    return post;
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('post');
  }
}
  