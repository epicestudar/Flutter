import 'package:flutter/material.dart';
import 'package:projeto_apirest/controllers/produtos_controller.dart';
import 'package:projeto_apirest/models/produtos.dart';


class ListaProdutosScreen extends StatefulWidget {
  const ListaProdutosScreen({super.key});

  @override
  State<ListaProdutosScreen> createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  final ProdutosController _controller = ProdutosController();

  //future lista de produtos
  Future<List<Produto>> futureProdutos() async{
    try {
      return _controller.getProdutosFromJson();
    } catch (e) {
      print(e);
      return [];
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //lista de produtos do json com future.builder
      body: FutureBuilder<List<Produto>>(
        future: futureProdutos(),
        builder: (context, snapshot) {
          if (_controller.listProdutos.isNotEmpty) {
            return ListView.builder(
              itemCount: _controller.listProdutos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.listProdutos[index].nome),
                  subtitle: Text((_controller.listProdutos[index].preco).toStringAsFixed(2)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}