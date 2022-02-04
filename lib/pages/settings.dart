import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import "package:provider/provider.dart";
import '../theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override 
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            // color: Colors.white,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ),
      body: Text("settings page")
    );
  }
}
