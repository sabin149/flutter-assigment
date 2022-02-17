import 'package:flutter/material.dart';
import '/pages/shared/config.dart';
import '/pages/shared/homepage.dart';
import '/pages/home/home.dart';
import '/pages/comment/comment.dart';
import '/pages/auth/register.dart';
import '/pages/search.dart';
import '/pages/profile/profile.dart';
import '/pages/upload.dart';
import 'pages/auth/login.dart';
import 'pages/bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'pages/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
          debugShowCheckedModeBanner: false,
          title: "Let's App",
          theme: value.getTheme(),
          initialRoute: '/mainpage',
          // initialRoute: mytoken==" "? '/login' : '/',

          routes: {
            '/': (context) => const BottomNavigationbar(),
            '/mainpage': (context) => const HomePage(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const Home(), 
            '/search': (context) => const Search(),
            '/upload': (context) => const Upload(),
            '/profile': (context) => const Profile(),
            '/comments': (context) => const Comments(),
          },
        );
      },
    );
  }
}
