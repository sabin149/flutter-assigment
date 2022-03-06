import "package:flutter/material.dart";
import 'config.dart';


class HomePage extends StatefulWidget {
 const  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;

  getToken() async {
    String? futureToken = await Config.loadToken();
    setState(() {
      token = futureToken!;

    });
  } 

  @override
  void initState() {
    super.initState();
    getToken();

  }


  @override
  Widget build(BuildContext context) {
    if (token == null) {
       Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    } else if (token == "") {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    } else {
      Future.delayed(Duration.zero, () {
   
        Navigator.pushReplacementNamed(context, '/', );
       
      });
    }

    return const Scaffold();
  }
}
