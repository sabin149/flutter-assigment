import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home.dart';
import 'package:frontend/pages/search/search.dart';
import 'package:frontend/pages/profile/profile.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/pages/upload.dart';

import '../model/post_model.dart';

class BottomNavigationbar extends StatefulWidget {
   final PostModel? post;


  const BottomNavigationbar({Key? key, this.post}) : super(key: key);
  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState(); 
}
class _BottomNavigationbarState extends State<BottomNavigationbar> {
      

  int _selectedIndex = 0;
  static  final List<Widget> _widgetOption = [
    const Home(),
    const Search(),
    const Upload(), 
    const Profile(),
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
            label: '' ,
          
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
