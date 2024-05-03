import 'package:flutter/material.dart';
import 'package:projeto_json/View/filme_cadastro.dart';
import 'package:projeto_json/View/filme_list.dart';
import 'package:projeto_json/View/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen(),
        '/list':(context) => FilmesListScreen(),
        '/cadastro':(context) => FilmeCadastroScreen()
      },
    );
  }
}

