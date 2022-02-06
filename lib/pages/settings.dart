import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import '../theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override 
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            ElevatedButton.icon(
               onPressed: ()  {
                   
                  
                },
              icon: const Icon(
                Icons.logout_outlined,
                size: 25,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
