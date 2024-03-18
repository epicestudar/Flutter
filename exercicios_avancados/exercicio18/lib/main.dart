import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Imagem',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Imagem'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://i.pinimg.com/564x/1f/43/2c/1f432c13745c65665a61a2eb66defdbb.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
