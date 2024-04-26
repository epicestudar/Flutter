import 'dart:convert';
import 'dart:io';

import 'package:exemplo_persistencia_json/Model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutoController {
  List<Produto> produtos = [];

  // métodos para codificar e decodificar json
  Future<List<Produto>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    produtos.clear();
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));

    return produtos;
  }

  // Método para salvar produtos no arquivo JSON
  // Future<void> saveProdutos() async {
  //   // Obtém o diretório de documentos do aplicativo
  //   final appDocDir = await getApplicationDocumentsDirectory();
  //   // Caminho do arquivo produtos.json no diretório de documentos
  //   final filePath = '${appDocDir.path}/produtos.json';
  //   // Converte os produtos em uma lista de JSON
  //   final jsonList = produtos.map((produto) => produto.toJson()).toList();
  //   // Escreve a lista de JSON no arquivo produtos.json
  //   await File(filePath).writeAsString(json.encode(jsonList));
  // }
}
