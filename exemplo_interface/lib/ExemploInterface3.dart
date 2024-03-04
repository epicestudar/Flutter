import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> itens = ['Item 1', 'Item 2', 'Item 3'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Itens'),
        ),
        body: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itens[index]),
              onTap: () {
// Lógica a ser executada ao clicar em um item
                print('Item clicado: ${itens[index]}');
              },
            );
          },
        ),
      ),
    );
  }
}
