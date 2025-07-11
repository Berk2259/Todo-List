import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index =
      2; //alt barın başlayacağı ilk ikonun index değeri

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      //Alt bardaki ikonları tutar.
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          index: index,
          items: items,
          onTap:
              (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
