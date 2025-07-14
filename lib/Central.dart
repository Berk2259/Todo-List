import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:todolist/Screen/FavoriteScreen.dart';
import 'package:todolist/Screen/FocusScreen.dart';
import 'package:todolist/Screen/HomeScreen.dart';
import 'package:todolist/Screen/MotivationScreen.dart';
import 'package:todolist/Screen/ProfilSceen.dart';

class Central extends StatefulWidget {
  const Central({super.key});

  @override
  State<Central> createState() => _CentralState();
}

class _CentralState extends State<Central> {
  int _page = 2;
  final List<Widget> _pages = [
    FavoriteScreen(),
    MotivationScreen(),
    HomeScreen(),
    FocusScreen(),
    ProfilScreen(),
  ];

  final items = <Widget>[
    //Alt bardaki ikonları tutar.
    Icon(Icons.favorite, size: 30),
    Icon(Icons.lightbulb, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.timer, size: 30),
    Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Todo List'),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 24),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        index: _page,
        items: items,
        onTap: (index) => setState(() => _page = index),
      ),
    );
  }
}
