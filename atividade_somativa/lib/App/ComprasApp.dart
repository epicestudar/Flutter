// Classe principal do aplicativo Flutter
import 'package:atividade_somativa/Controller/ComprasController.dart';
import 'package:atividade_somativa/View/ComprasView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen e utilizando o Provider
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasModel(),
        child: ListaComprasScreen(),
      ),
    );
  }
}