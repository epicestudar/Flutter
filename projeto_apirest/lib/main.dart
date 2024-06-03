import 'package:flutter/material.dart';
import 'package:projeto_apirest/screens/home_screen.dart';
import 'package:projeto_apirest/screens/lista_produtos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto ApiRest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/listar': (context) => const ListaProdutosScreen(),
      },
    );
  }
}