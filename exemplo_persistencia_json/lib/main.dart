import 'package:flutter/material.dart';

import 'View/produtos_view.dart';

void main() {
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos Json',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProdutosPage(),
    );
  }
}