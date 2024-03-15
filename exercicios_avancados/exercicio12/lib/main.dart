import 'package:flutter/material.dart';
import 'package:exercicio12/pages/moedas_page.dart'; // Importe o arquivo moedas_page.dart onde você definiu a classe MoedasPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoedasPage(), // Aqui você instancia o MoedasPage como a tela inicial do seu aplicativo
    );
  }
}
