import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Página de Login'))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Insira seus dados'),
            TextField(
              decoration: InputDecoration(
              labelText: 'E-mail',
              ),
            ),
            TextField(
              obscureText: true, // não aparece a senha
               decoration: InputDecoration(
              labelText: 'Senha', )
            ),
            Text('Esqueceu sua senha?'),
            ElevatedButton(
                onPressed: () {
                  print('Entrar pressionado');
                },
                child: Text('Entrar'))
          ],
        ),
      ),
    );
  }
}
