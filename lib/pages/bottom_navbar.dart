import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:frontend/pages/profile/widgets/profile.dart';
import 'package:frontend/pages/search/search.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/pages/upload.dart';
import 'package:frontend/services/httpuser.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:all_sensors2/all_sensors2.dart';

import 'shared/theme.dart';
 
class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({
    Key? key,
  }) : super(key: key);
  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  bool _proximityValues = false;
  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOption = [
    const Home(),
    const Search(),
    const Upload(),
    const MyProfile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      Provider.of<ThemeProvider>(context, listen: false).swapTheme();

      _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
        _proximityValues = event.getValue();
        if (_proximityValues == true) {
          
          showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            var res = await HttpConnectUser.logout();
                            if (res) {
                              Navigator.pushNamed(context, '/login');
                              MotionToast.success(
                                      description:
                                          const Text('Logout Successfully'))
                                  .show(context);
                            } else {
                              MotionToast.error(
                                      description:
                                          const Text(' Failed to logout'))
                                  .show(context);
                            }
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
        }else{
          print('not working');
        }
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: blackColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_upload_sharp,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}