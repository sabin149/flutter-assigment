import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import "package:provider/provider.dart";
import '../http/httpuser.dart';
import '../theme.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override 
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formkey = GlobalKey<FormState>();

   Future<bool> logoutUser() {
    var res = HttpConnectUser().logout();
    return res;
  }
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
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            ElevatedButton.icon(
               onPressed: () async {
                    var res = await logoutUser();
                    if (res) {
                      Navigator.pushNamed(context, '/login');
                      MotionToast.success(
                              description: const Text('Logout Successfully'))
                          .show(context);
                    } else {
                      MotionToast.error(
                              description: const Text('Logout Failed'))
                          .show(context);
                    }
                  
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
