import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:frontend/pages/search.dart';
import 'package:frontend/pages/settings.dart';
import 'package:frontend/pages/upload.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState(); 
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = [
    Home(),
    Search(),
    Upload(),
    Settings()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_upload_sharp,
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
