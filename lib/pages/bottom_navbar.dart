import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/pages/favorites_page.dart';
import 'package:fooddelivery/pages/home_page.dart';

import 'account_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = const [HomePage(), FavoritesPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget? appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(title: const Text("foody"));
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(middle: const Text("foody"));
    } else {
      appBar = null;
    }
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: bodyOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(fontSize: 20),
        onTap: onItemTapped,
      ),
    );
  }
}
