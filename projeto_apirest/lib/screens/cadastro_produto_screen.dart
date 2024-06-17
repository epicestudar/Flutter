import 'package:flutter/material.dart';
import 'package:projeto_apirest/controllers/produtos_controller.dart';
import 'package:projeto_apirest/models/produtos.dart';

class CadastrarProdutoScreen extends StatefulWidget {
  const CadastrarProdutoScreen({super.key});

  @override
  State<CadastrarProdutoScreen> createState() => _CadastrarProdutoScreenState();
}

class _CadastrarProdutoScreenState extends State<CadastrarProdutoScreen> {
  final ProdutosController _controller = ProdutosController();
  final TextEditingController _nomeText = TextEditingController();
  final TextEditingController _codigoText = TextEditingController();
  final TextEditingController _precoText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getProdutosFromJson();
  }

  //postProduto
  Future<void> _postProduto() async {
    Produto produto = Produto(
        id: (_controller.listProdutos.length + 1).toString(),
        nome: _nomeText.text,
        codigo: _codigoText.text,
        preco: double.parse(_precoText.text));
    try {
      await _controller.postProdutosToJson(produto);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela de Cadastro de Produto
      appBar: AppBar(
        title: const Text("Cadastro de Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeText,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),
            TextField(
              controller: _codigoText,
              decoration: const InputDecoration(
                labelText: "Código",
              ),
            ),
            TextField(
              controller: _precoText,
              decoration: const InputDecoration(
                labelText: "Preço",
              ),
            ),
            ElevatedButton(
              onPressed: _cadastrar(),
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }

  _cadastrar() {
    return () {
      _postProduto();
      //clear
      _nomeText.clear();
      _codigoText.clear();
      _precoText.clear();
    };
  }
}
