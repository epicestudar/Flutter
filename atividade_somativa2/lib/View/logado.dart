import 'package:atividade_somativa2/Controller/database.dart';
import 'package:atividade_somativa2/View/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogadoPage extends StatefulWidget {
  @override
  _LogadoPageState createState() => _LogadoPageState();
}

class _LogadoPageState extends State<LogadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário Logado'),
      ),
    );
  }
}
