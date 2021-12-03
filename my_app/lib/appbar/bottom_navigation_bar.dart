import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/favoris_screen.dart';
import 'package:my_app/screens/menu_screen.dart';
import 'package:my_app/screens/recettes_screen.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    FavorisPage(),
    RecettesPage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),*/
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        currentIndex: currentIndex = currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
            backgroundColor: Colors.amber,
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
            backgroundColor: Colors.green,
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Recettes',
            backgroundColor: Colors.orange,
          ), 
            BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded),
            label: 'Menu',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}