import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projeto_json/Model/filmes.dart';

class FilmeController {
  List<Filme> listFilmes = [];

  // GET

  // salvar Json
  Future<void> salvarJson() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = listFilmes.map((filme) => filme.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  // carregar Json
  Future<List<Filme>> loadJson() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;
      final file = File('$path/filmes.json');
      final jsonList = jsonDecode(await file.readAsString());
      listFilmes = jsonList.map((filme) => Filme.fromJson(filme)).toList();
    } catch (e) {
      listFilmes = [];
    }

    return listFilmes;
  }

  // adicionar filme
  Future<void> adicionarFilme(Filme filme) async {
    listFilmes.add(filme);
  }
}