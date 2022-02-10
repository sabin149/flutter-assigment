import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:frontend/pages/register.dart';
import 'package:frontend/pages/search.dart';
import 'package:frontend/pages/settings.dart';
import 'package:frontend/pages/upload.dart';
import '/pages/login.dart';
import 'http/httpuser.dart';
import 'pages/bottom_navbar.dart'; 
import 'package:provider/provider.dart';
import './theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

 
  // String mytoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYjc3YTlmYzI5MTFjYTQ5NGJlOTkxYyIsImlhdCI6MTY0NDgyMTYzNywiZXhwIjoxNjQ0OTA4MDM3fQ.-iGFPTvv4slkjnCplfscd0fRMhRVLnSHGuCa7u8gZb0";
  String mytoken = HttpConnectUser.token;
  

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
          title: 'Social Media App',
          theme: value.getTheme(),
         
          initialRoute:'/login',
          // initialRoute: mytoken==" "? '/login' : '/',

          routes: { 
 
            '/': (context) => const BottomNavigationbar(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const Home(),
            '/search': (context) => const Search(), 
            '/upload': (context) => const Upload(),
            '/settings': (context) => const Settings(),
          },
        );
      },
    ); 
  }
}
