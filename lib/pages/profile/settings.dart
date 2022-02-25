import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';

import '../../services/httpuser.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding( 
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    ),
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .swapTheme();
                }, 
                icon: const Icon(
                  Icons.brightness_6,
                  size: 28,
                ),
                label: const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    primary:blueColor),
                onPressed: () async {
                  var res = await HttpConnectUser.logout();
                  if (res) {
                    Navigator.pushNamed(context, '/login');
                    MotionToast.success(
                            description: const Text('Logout Successfully'))
                        .show(context);
                  } else {
                    MotionToast.error(
                            description: const Text(' Failed to logout'))
                        .show(context);
                  }
                },
                icon: const Icon(
                  Icons.people,
                  size: 28,
                ),
                label: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
