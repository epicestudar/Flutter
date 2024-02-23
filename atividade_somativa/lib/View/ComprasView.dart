// Classe que representa a tela principal da lista de tarefas
import 'package:atividade_somativa/Controller/ComprasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova compra
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Adicione o item na lista',
                // Ícone para adicionar compra ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarCompra do Provider para atualizar o estado
                    Provider.of<ListaComprasModel>(context, listen: false)
                        .adicionarCompra(_controller.text);
                    // Limpar o campo de texto após adicionar a compra
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de compras usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da compra
                      title: Row(
                        children: [
                          Text(model.compras[index].descricao),
                          SizedBox(
                              width:
                                  10), // Espaço entre a descrição e os botões de quantidade
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  // Reduz a quantidade quando o botão de remoção é pressionado
                                  if (model.compras[index].quantidade > 1) {
                                    model.atualizarQuantidade(index,
                                        model.compras[index].quantidade - 1);
                                  }
                                },
                              ),
                              Text(
                                  '${model.compras[index].quantidade}'), // Exibição da quantidade
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Aumenta a quantidade quando o botão de adição é pressionado
                                  model.atualizarQuantidade(index,
                                      model.compras[index].quantidade + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Exibição da data e hora da tarefa
                      subtitle: Text(
                        '${model.compras[index].dataHora.day}/${model.compras[index].dataHora.month}/${model.compras[index].dataHora.year} ${model.compras[index].dataHora.hour}:${model.compras[index].dataHora.minute}',
                      ),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.compras[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Ícone de lixeira para excluir a compra
                      leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Chamando o método excluirCompra do Provider para remover a compra da lista
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
