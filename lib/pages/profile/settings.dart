import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:provider/provider.dart';

import '../shared/theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
          title: const Text(
        'Settings',
        style: TextStyle(
          color: Colors.white,
        ),
      )),
      body: Column( 
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 40)
            ),
            
            onPressed: (){
              Config.removeToken();
            }, icon: const Icon(Icons.people), label: Text("Logout"),

          )
        ],
      ),
    );
  }
}
 