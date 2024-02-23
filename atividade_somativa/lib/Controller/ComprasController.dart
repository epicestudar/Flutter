import 'package:atividade_somativa/Model/ComprasModel.dart';
import 'package:flutter/material.dart';

// Classe que gerencia o estado da lista de compras usando o Provider
class ListaComprasModel extends ChangeNotifier {
  // Lista de compras
  List<Compra> _compras = [];

  // Getter para acessar a lista de tarefas
  List<Compra> get compras => _compras;

  // Método para adicionar uma nova compra à lista
 // Método para adicionar uma nova compra à lista
// Método para adicionar uma nova compra à lista
void adicionarCompra(String descricao) {
  if (descricao.trim() != '') { 
    // Convertendo a descrição atual e as descrições existentes na lista para minúsculas
    String descricaoMinuscula = descricao.trim().toLowerCase();
    List<String> descricoesExistentes = _compras.map((compra) => compra.descricao.toLowerCase()).toList();
    
    // Verifica se a descrição já existe na lista de compras (em minúsculas)
    bool jaExiste = descricoesExistentes.contains(descricaoMinuscula);
    
    // Se a compra já existe, não faz nada
    if (jaExiste) {
      return;
    }
    
    DateTime dataHoraAtual = DateTime.now(); // Obtém a data e hora atuais
    _compras.add(Compra(descricao.trim(), false, dataHoraAtual));
    
    // Notifica os ouvintes (widgets) sobre a mudança no estado
    notifyListeners();
  }
}




  // Método para marcar uma compra como concluída com base no índice
  void marcarComoConcluida(int indice) {
  if (indice >= 0 && indice < _compras.length) {
    if (_compras[indice].concluida) {
      _compras[indice].concluida = false; // Altera para não concluída
    } else {
      _compras[indice].concluida = true; // Marca como concluída
    }
    // Notifica os ouvintes sobre a mudança no estado
    notifyListeners();
  }
}


  // Método para excluir uma compra com base no índice
  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
  void atualizarQuantidade(int indice, int quantidade) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].quantidade = quantidade;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

// Método para ordenar a lista de compras por ordem alfabética
  void ordenarComprasPorOrdemAlfabetica() {
    _compras.sort((a, b) => a.descricao.toLowerCase().compareTo(b.descricao.toLowerCase()));
    notifyListeners();
  }


}