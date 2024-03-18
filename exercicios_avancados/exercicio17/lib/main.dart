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
          title: Text('Exemplo de Stack'),
        ),
        body: Stack(
          children: [
            // Widget de fundo (vermelho)
            Container(
              color: Colors.red,
              width: double.infinity,
              height: double.infinity,
            ),
            // Widget sobreposto (verde, menor)
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                color: Colors.green,
                width: 200,
                height: 200,
              ),
            ),
            // Widget sobreposto (azul, menor)
            Positioned(
              bottom: 50,
              right: 50,
              child: Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
