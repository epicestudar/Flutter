import 'package:app_animais/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaAnimais extends StatelessWidget{
   // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Animais'),
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
                labelText: 'Adicione o animal na lista',
                // Ícone para adicionar compra ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarCompra do Provider para atualizar o estado
                    Provider.of<AnimalController>(context, listen: false)
                        .adicionarAnimal(_controller.text, "", "");
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
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da compra
                      title: Row(
                        children: [
                          Text(model.listarAnimais[index].especie),
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
                      // Checkbox para marcar a tarefa como concluíd
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

class TelaAnimalDetalhe {

}