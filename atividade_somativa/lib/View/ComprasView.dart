// Classe que representa a tela principal da lista de tarefas
import 'package:atividade_somativa/Controller/ComprasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Adicione o item na lista',
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<ListaComprasModel>(context, listen: false)
                        .adicionarCompra(_controller.text);
                    Provider.of<ListaComprasModel>(context, listen: false)
                        .ordenarComprasPorOrdemAlfabetica(); // Ordenar após adicionar
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaComprasModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _controller.text = model.compras[index].descricao;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Editar Item'),
                                      content: TextField(
                                        controller: _controller,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            model.editarCompra(index, _controller.text);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Salvar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(model.compras[index].descricao),
                            ),
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (model.compras[index].quantidade > 1) {
                                    model.atualizarQuantidade(index, model.compras[index].quantidade - 1);
                                  }
                                },
                              ),
                              Text('${model.compras[index].quantidade}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  model.atualizarQuantidade(index, model.compras[index].quantidade + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '${model.compras[index].dataHora.day}/${model.compras[index].dataHora.month}/${model.compras[index].dataHora.year} ${model.compras[index].dataHora.hour}:${model.compras[index].dataHora.minute}',
                      ),
                      trailing: Checkbox(
                        value: model.compras[index].concluida,
                        onChanged: (value) {
                          model.marcarComoConcluida(index);
                        },
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          model.excluirCompra(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
