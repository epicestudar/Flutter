import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaOlaMundo(),
    );
  }
}

class TelaOlaMundo extends StatefulWidget {
  @override
  _TelaOlaMundoState createState() => _TelaOlaMundoState();
}

class _TelaOlaMundoState extends State<TelaOlaMundo> {
  TextEditingController _controllerNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá Mundo Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Digite seu nome:'),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _controllerNome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nome = _controllerNome.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Olá, $nome!')),
                );
              },
              child: Text('Clique para saudar'),
            ),
          ],
        ),
      ),
    );
  }
}
