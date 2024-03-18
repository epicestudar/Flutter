import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _progressValue = 0.0;

  void _startProgress() {
    // Simula o início de uma tarefa
    _progressValue = 0.0;

    // Inicia um Timer para atualizar progressivamente a barra de progresso
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 1.0) {
          timer.cancel(); // Cancela o Timer quando o progresso chega a 100%
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progresso da Tarefa',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Progresso da Tarefa'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startProgress,
                child: Text('Iniciar Tarefa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
