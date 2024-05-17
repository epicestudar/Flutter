import 'package:flutter/material.dart';

import 'View/favorites_screen.dart';
import 'View/home_screen.dart';
import 'View/search_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Clima",
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search':(context) => SearchScreen(),
        '/favorites': (context) => FavoriteScreen(),
      },
    );
  }
}