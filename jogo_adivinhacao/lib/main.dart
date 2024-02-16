import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  int _numeroSorteado = Random().nextInt(101);
  String _resultado = '';

  void _calcular(String operacao) {
    int numero1 = int.tryParse(_controllerNumero1.text) ?? 0;

    setState(() {
      if (_numeroSorteado == numero1) {
        _resultado = 'Parabéns! Você acertou o número.';
      } else if (_numeroSorteado > numero1) {
        _resultado = 'Tente um número maior';
      } 
      else if (_numeroSorteado < numero1) {
        _resultado = 'Tente um número menor';
      }
      else {
        _resultado = 'Ops! Tente novamente.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite um número de 0 a 100'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Sortear'),
              child: Text('Verificar'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
