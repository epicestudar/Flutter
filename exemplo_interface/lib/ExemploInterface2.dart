import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botão Interativo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
// Lógica a ser executada ao clicar no botão
              print('Botão pressionado!');
            },
            child: Text('Clique Aqui'),
          ),
        ),
      ),
    );
  }
}
