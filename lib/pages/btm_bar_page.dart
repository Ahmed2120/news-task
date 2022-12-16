
import 'package:flutter/material.dart';
import 'package:galaxy_task/pages/settings_page.dart';

import 'favorite_page.dart';
import 'home_page.dart';
import 'search_page.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  List pages = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black87,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        items: bottomNavigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems() => [
    BottomNavigationBarItem(
        icon:
        Icon(Icons.home, color: _selectedIndex == 0 ? Colors.deepOrange : Colors.grey,),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.search, color: _selectedIndex == 1 ? Colors.deepOrange : Colors.grey,),
        label: ''),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark, color: _selectedIndex == 2 ? Colors.deepOrange : Colors.grey,),
    label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings, color: _selectedIndex == 3 ? Colors.deepOrange : Colors.grey,),
    label: ''),
  ];
}
