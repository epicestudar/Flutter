import 'package:exemplo_persistencia_json/Model/produtos_model.dart';
import 'package:flutter/material.dart';

class ProdutoInfoPage extends StatelessWidget {
  Produto produto;
  ProdutoInfoPage({
    required this.produto
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto Info'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(produto.nome),
            Text('${produto.preco.toStringAsFixed(2)}'),
            Text(produto.categoria)
          ],
        ),
      ),
    );
  }
}