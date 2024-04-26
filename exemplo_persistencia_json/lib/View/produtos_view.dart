import 'package:exemplo_persistencia_json/Controller/produtos_controller.dart';
import 'package:exemplo_persistencia_json/Model/produtos_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoController _controller = new ProdutoController();

  @override
  void initState() {
    _controller.loadProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Produtos'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Produto>>(
                future: _controller.loadProdutos(),
                builder: (context, snapshot) {
                  if (_controller.produtos.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _controller.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = _controller.produtos[index];
                          return ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                          );
                        },
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                },
              )
            ),
          ],
        ));
  }
}
