// Classe principal do aplicativo Flutter
import 'package:app_lista1/TarefasController.dart';
import 'package:app_lista1/TarefasView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen e utilizando o Provider
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasModel(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}