import 'dart:html';

import 'package:app_lista1/TarefasModel.dart';
import 'package:flutter/material.dart';

// Classe que gerencia o estado da lista de tarefas usando o Provider
class ListaTarefasModel extends ChangeNotifier {
  // Lista de tarefas
  List<Tarefa> _tarefas = [];

  // Getter para acessar a lista de tarefas
  List<Tarefa> get tarefas => _tarefas;

  // Método para adicionar uma nova tarefa à lista
 void adicionarTarefa(String descricao) {
  if (descricao.trim() != '') { 
    DateTime dataHoraAtual = DateTime.now(); // Obtém a data e hora atuais
    _tarefas.add(Tarefa(descricao.trim(), false, dataHoraAtual));
  } else {
   
  }
  // Notifica os ouvintes (widgets) sobre a mudança no estado
  notifyListeners();
}


  // Método para marcar uma tarefa como concluída com base no índice
  void marcarComoConcluida(int indice) {
  if (indice >= 0 && indice < _tarefas.length) {
    if (_tarefas[indice].concluida) {
      _tarefas[indice].concluida = false; // Altera para não concluída
    } else {
      _tarefas[indice].concluida = true; // Marca como concluída
    }
    // Notifica os ouvintes sobre a mudança no estado
    notifyListeners();
  }
}


  // Método para excluir uma tarefa com base no índice
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
