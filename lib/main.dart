import 'package:flutter/material.dart';
import 'package:frontend/pages/profile/settings.dart';

import '/pages/shared/homepage.dart';

import '/pages/comment/comment.dart';
import '/pages/auth/register.dart';

import '/pages/profile/profile.dart';

import 'pages/auth/login.dart';
import 'pages/bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'pages/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'letsconnect',
            channelName: 'letsconnect',
            channelDescription: "letsconnect Notification",
            defaultColor: const Color(0xFF105F49),
            ledColor: Colors.white,
            playSound: true, 
            enableLights: true,
            enableVibration: true)
      ]);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: const MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   
    return Consumer<ThemeProvider>( 
      builder: (context, value, child) {
        return MaterialApp(
          
            // visualDensity: VisualDensity.adaptivePlatformDensity,
          debugShowCheckedModeBanner: false,
          title: "Let's App",
          theme: value.getTheme(),
          initialRoute: '/mainpage',
          routes: {
            '/': (context) => const BottomNavigationbar(),
            '/mainpage': (context) => const HomePage(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(), 
            '/profile': (context) => const Profile(),
            '/settings': (context) => const Settings(),
            '/comments': (context) => const CommentsPage(),
          },
        );
      },
    );
  }

}
